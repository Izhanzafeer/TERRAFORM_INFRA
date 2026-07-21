subscription_id = "54ff4cf6-32b8-4112-ac42-05a514813214"

location = "East US"

resource_group_name = "RG-PRODUCTION-DR"

vnet_name = "Prod-DR-VNet"

vnet_address_space = [
  "10.30.0.0/16"
]

aks_subnet_name = "SNET-AKS-DR"
aks_subnet_prefix = [
  "10.30.1.0/24"
]

appgw_subnet_name = "SNET-APPGW-DR"
appgw_subnet_prefix = [
  "10.30.2.0/24"
]

private_subnet_name = "SNET-PVT-DR"
private_subnet_prefix = [
  "10.30.3.0/24"
]

data_subnet_name = "SNET-DATA-DR"
data_subnet_prefix = [
  "10.30.4.0/24"
]

acr_subnet_name = "SNET-ACR-DR"
acr_subnet_prefix = [
  "10.30.5.0/24"
]

tags = {
  Environment = "Production-DR"
  Project     = "AIS"
  ManagedBy   = "Terraform"
}

route_table_name = "RT-PRODUCTION-DR"

log_analytics_name = "law-production-dr"

log_analytics_sku = "PerGB2018"

retention_in_days = 30

application_insights_name = "appi-production-dr"

application_type = "web"

acr_name = "acrproductiondr001"

acr_sku = "Premium"

acr_admin_enabled = false

key_vault_name = "kv-production-dr-001"

tenant_id = "75f2a99b-01fd-48f2-ac60-d4a7a44fd0cc"

key_vault_sku = "standard"

appgw_public_ip_name = "pip-appgw-production-dr"

public_ip_sku = "Standard"

allocation_method = "Static"

application_gateway_name = "agw-production-dr"

application_gateway_capacity = 2

aks_name = "aks-production-dr"

aks_dns_prefix = "aksproddr"

aks_node_count = 2

aks_vm_size = "Standard_D4s_v5"

aks_os_disk_size_gb = 128

postgres_server_name = "psql-production-dr"

postgres_admin_username = "pgadmin"

postgres_admin_password = "ChangeThisToAStrongPassword!"

postgres_private_dns_zone_name = "privatelink.postgres.database.azure.com"

postgres_private_endpoint_name = "pep-postgresql-dr"

redis_name = "redis-production-dr"

redis_capacity = 1

redis_family = "C"

redis_sku_name = "Standard"

keyvault_diagnostic_name = "kv-dr-diagnostics"

acr_diagnostic_name = "acr-dr-diagnostics"

appgw_diagnostic_name = "appgw-dr-diagnostics"

postgres_diagnostic_name = "postgres-dr-diagnostics"

aks_nsg_name = "NSG-AKS-DR"

appgw_nsg_name = "NSG-APPGW-DR"

private_nsg_name = "NSG-PRIVATE-DR"

data_nsg_name = "NSG-DATA-DR"

acr_nsg_name = "NSG-ACR-DR"

storage_account_name = "stprodxxxxdr"

action_group_name       = "ag-prod-dr"
action_group_short_name = "AGDR"

action_group_email_receivers = [
  {
    name          = "Admin"
    email_address = "admin@example.com"
  }
]

allowed_locations_policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"

network_watcher_name = "NetworkWatcher-westus"