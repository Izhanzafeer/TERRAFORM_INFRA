module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {
  source = "../../modules/virtual-network"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

module "aks_subnet" {
  source = "../../modules/subnet"

  name                 = var.aks_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.aks_subnet_prefix
}

module "appgw_subnet" {
  source = "../../modules/subnet"

  name                 = var.appgw_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.appgw_subnet_prefix
}

module "private_subnet" {
  source = "../../modules/subnet"

  name                 = var.private_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.private_subnet_prefix
}

module "data_subnet" {
  source = "../../modules/subnet"

  name                 = var.data_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.data_subnet_prefix
}

module "acr_subnet" {
  source = "../../modules/subnet"

  name                 = var.acr_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.acr_subnet_prefix
}

module "route_table" {
  source = "../../modules/route-table"

  name                = var.route_table_name
  location            = var.location
  resource_group_name = module.resource_group.name

  tags = var.tags
}

module "aks_route_table_association" {
  source = "../../modules/route-table-association"

  subnet_id      = module.aks_subnet.id
  route_table_id = module.route_table.id
}

module "appgw_route_table_association" {
  source = "../../modules/route-table-association"

  subnet_id      = module.appgw_subnet.id
  route_table_id = module.route_table.id
}

module "private_route_table_association" {
  source = "../../modules/route-table-association"

  subnet_id      = module.private_subnet.id
  route_table_id = module.route_table.id
}

module "data_route_table_association" {
  source = "../../modules/route-table-association"

  subnet_id      = module.data_subnet.id
  route_table_id = module.route_table.id
}

module "acr_route_table_association" {
  source = "../../modules/route-table-association"

  subnet_id      = module.acr_subnet.id
  route_table_id = module.route_table.id
}

output "aks_route_table_association_id" {
  value = module.aks_route_table_association.id
}

module "log_analytics" {

  source = "../../modules/log-analytics"

  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = module.resource_group.name

  sku               = var.log_analytics_sku
  retention_in_days = var.retention_in_days

  tags = var.tags
}

module "application_insights" {

  source = "../../modules/application-insights"

  name                = var.application_insights_name
  location            = var.location
  resource_group_name = module.resource_group.name

  workspace_id = module.log_analytics.id

  application_type = var.application_type

  tags = var.tags
}

module "container_registry" {

  source = "../../modules/container-registry"

  name                = var.acr_name
  resource_group_name = module.resource_group.name
  location            = var.location

  sku           = var.acr_sku
  admin_enabled = var.acr_admin_enabled

  tags = var.tags
}

module "key_vault" {

  source = "../../modules/key-vault"

  name                = var.key_vault_name
  location            = var.location
  resource_group_name = module.resource_group.name

  tenant_id = var.tenant_id
  sku_name  = var.key_vault_sku

  tags = var.tags
}

module "public_ip" {

  source = "../../modules/public-ip"

  name                = var.appgw_public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.name

  sku               = var.public_ip_sku
  allocation_method = var.allocation_method

  tags = var.tags
}

module "application_gateway" {

  source = "../../modules/application-gateway"

  name                = var.application_gateway_name
  location            = var.location
  resource_group_name = module.resource_group.name

  subnet_id    = module.appgw_subnet.id
  public_ip_id = module.public_ip.id

  capacity = var.application_gateway_capacity

  tags = var.tags
}

module "aks" {

  source = "../../modules/aks"

  name                = var.aks_name
  location            = var.location
  resource_group_name = module.resource_group.name

  dns_prefix = var.aks_dns_prefix

  subnet_id = module.aks_subnet.id

  log_analytics_workspace_id = module.log_analytics.id

  node_count      = var.aks_node_count
  vm_size         = var.aks_vm_size
  os_disk_size_gb = var.aks_os_disk_size_gb

  tags = var.tags
}

module "private_dns_zone" {

  source = "../../modules/private-dns-zone"

  name                = var.postgres_private_dns_zone_name
  resource_group_name = module.resource_group.name

  virtual_network_id = module.virtual_network.id

  tags = var.tags
}

module "postgresql" {

  source = "../../modules/postgresql-flexible-server"

  name                = var.postgres_server_name
  resource_group_name = module.resource_group.name
  location            = var.location

  administrator_login    = var.postgres_admin_username
  administrator_password = var.postgres_admin_password

  postgres_version = var.postgres_version

  delegated_subnet_id = module.data_subnet.id
  private_dns_zone_id = module.private_dns_zone.id

  tags = var.tags
}

# module "aks_acr_pull" {
#
#   source = "../../modules/role-assignment"
#
#   scope                = module.container_registry.id
#   role_definition_name = "AcrPull"
#   principal_id         = module.aks.kubelet_identity[0].object_id
# }

module "postgres_private_endpoint" {

  source = "../../modules/private-endpoint"

  name                = var.postgres_private_endpoint_name
  location            = var.location
  resource_group_name = module.resource_group.name

  subnet_id = module.private_subnet.id

  private_resource_id = module.postgresql.id

  subresource_names = ["postgresqlServer"]

  private_dns_zone_ids = [
    module.private_dns_zone.id
  ]

  tags = var.tags
}

module "redis_cache" {

  source = "../../modules/redis-cache"

  name                = var.redis_name
  location            = var.location
  resource_group_name = module.resource_group.name

  capacity = var.redis_capacity
  family   = var.redis_family
  sku_name = var.redis_sku_name

  tags = var.tags
}

module "keyvault_diagnostics" {

  source = "../../modules/diagnostic-settings"

  name = var.keyvault_diagnostic_name

  target_resource_id = module.key_vault.id

  log_analytics_workspace_id = module.log_analytics.id
}

module "acr_diagnostics" {

  source = "../../modules/diagnostic-settings"

  name = var.acr_diagnostic_name

  target_resource_id = module.container_registry.id

  log_analytics_workspace_id = module.log_analytics.id
}

module "appgw_diagnostics" {

  source = "../../modules/diagnostic-settings"

  name = var.appgw_diagnostic_name

  target_resource_id = module.application_gateway.id

  log_analytics_workspace_id = module.log_analytics.id
}

module "postgres_diagnostics" {

  source = "../../modules/diagnostic-settings"

  name = var.postgres_diagnostic_name

  target_resource_id = module.postgresql.id

  log_analytics_workspace_id = module.log_analytics.id
}

module "aks_nsg" {

  source = "../../modules/network-security-group"

  name                = var.aks_nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name

  security_rules = []

  tags = var.tags
}

module "appgw_nsg" {

  source = "../../modules/network-security-group"

  name                = var.appgw_nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name

  security_rules = []

  tags = var.tags
}

module "acr_nsg" {

  source = "../../modules/network-security-group"

  name                = var.acr_nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name

  security_rules = []

  tags = var.tags
}

module "aks_nsg_association" {

  source = "../../modules/subnet-network-security-group-association"

  subnet_id                 = module.aks_subnet.id
  network_security_group_id = module.aks_nsg.id
}

module "private_nsg" {
  source = "../../modules/network-security-group"

  name                = var.private_nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name

  security_rules = []

  tags = var.tags
}

module "data_nsg" {
  source = "../../modules/network-security-group"

  name                = var.data_nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name

  security_rules = []

  tags = var.tags
}

module "data_nsg_association" {

  source = "../../modules/subnet-network-security-group-association"

  subnet_id                 = module.data_subnet.id
  network_security_group_id = module.data_nsg.id
}

module "acr_nsg_association" {

  source = "../../modules/subnet-network-security-group-association"

  subnet_id                 = module.acr_subnet.id
  network_security_group_id = module.acr_nsg.id
}

module "appgw_nsg_association" {
  source = "../../modules/subnet-network-security-group-association"

  subnet_id                 = module.appgw_subnet.id
  network_security_group_id = module.appgw_nsg.id
}

module "private_nsg_association" {
  source = "../../modules/subnet-network-security-group-association"

  subnet_id                 = module.private_subnet.id
  network_security_group_id = module.private_nsg.id
}
module "storage_account" {
  source = "../../modules/storage-account"

  name                = var.storage_account_name
  resource_group_name = module.resource_group.name
  location            = var.location

  tags = var.tags
}

module "action_group" {
  source = "../../modules/action-group"

  name                = var.action_group_name
  resource_group_name = module.resource_group.name
  short_name          = var.action_group_short_name

  email_receivers = var.action_group_email_receivers

  tags = var.tags
}

module "storage_account_alert" {
  source = "../../modules/monitor-alert"

  name                = "prod-dr-storage-availability-alert"
  resource_group_name = module.resource_group.name

  target_resource_id = module.storage_account.id
  action_group_id    = module.action_group.id

  description      = "Production DR Storage Account Availability Alert"
  metric_namespace = "Microsoft.Storage/storageAccounts"
  metric_name      = "Availability"

  aggregation = "Average"
  operator    = "LessThan"
  threshold   = 99

  tags = var.tags
}

module "allowed_locations_policy" {
  source = "../../modules/policy-assignment"

  name                 = "allowed-locations"
  display_name         = "Allowed Azure Locations"
  subscription_id      = var.subscription_id
  policy_definition_id = var.allowed_locations_policy_definition_id
  location             = var.location

  description = "Restrict deployments to approved Azure regions."
}
module "network_watcher" {
  source = "../../modules/network-watcher"

  name                = var.network_watcher_name
  resource_group_name = module.resource_group.name
  location            = var.location

  tags = var.tags
}