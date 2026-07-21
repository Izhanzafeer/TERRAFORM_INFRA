output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_name" {
  value = module.virtual_network.name
}

output "aks_subnet_id" {
  value = module.aks_subnet.id
}

output "appgw_subnet_id" {
  value = module.appgw_subnet.id
}

output "private_subnet_id" {
  value = module.private_subnet.id
}

output "data_subnet_id" {
  value = module.data_subnet.id
}

output "acr_subnet_id" {
  value = module.acr_subnet.id
}

output "route_table_id" {
  value = module.route_table.id
}

output "log_analytics_workspace_id" {
  value = module.log_analytics.id
}

output "log_analytics_workspace_name" {
  value = module.log_analytics.name
}

output "application_insights_id" {
  value = module.application_insights.id
}


output "application_insights_name" {
  value = module.application_insights.name
}

output "acr_id" {
  value = module.container_registry.id
}

output "acr_name" {
  value = module.container_registry.name
}

output "acr_login_server" {
  value = module.container_registry.login_server
}

output "key_vault_id" {
  value = module.key_vault.id
}

output "key_vault_name" {
  value = module.key_vault.name
}

output "key_vault_uri" {
  value = module.key_vault.vault_uri
}

output "public_ip_id" {
  value = module.public_ip.id
}

output "public_ip_name" {
  value = module.public_ip.name
}

output "public_ip_address" {
  value = module.public_ip.ip_address
}

output "application_gateway_id" {
  value = module.application_gateway.id
}

output "application_gateway_name" {
  value = module.application_gateway.name
}

output "aks_id" {
  value = module.aks.id
}

output "aks_name" {
  value = module.aks.name
}

output "postgresql_id" {
  value = module.postgresql.id
}

output "postgresql_name" {
  value = module.postgresql.name
}

output "postgresql_fqdn" {
  value = module.postgresql.fqdn
}

output "private_dns_zone_id" {
  value = module.private_dns_zone.id
}

output "private_dns_zone_name" {
  value = module.private_dns_zone.name
}

output "postgres_private_endpoint_id" {
  value = module.postgres_private_endpoint.id
}

output "redis_cache_id" {
  value = module.redis_cache.id
}

output "redis_cache_name" {
  value = module.redis_cache.name
}

output "redis_hostname" {
  value = module.redis_cache.hostname
}

output "keyvault_diagnostic_id" {
  value = module.keyvault_diagnostics.id
}

output "acr_diagnostic_id" {
  value = module.acr_diagnostics.id
}

output "appgw_diagnostic_id" {
  value = module.appgw_diagnostics.id
}

output "postgres_diagnostic_id" {
  value = module.postgres_diagnostics.id
}

output "aks_nsg_id" {
  value = module.aks_nsg.id
}

output "appgw_nsg_id" {
  value = module.appgw_nsg.id
}

output "private_nsg_id" {
  value = module.private_nsg.id
}

output "data_nsg_id" {
  value = module.data_nsg.id
}

output "acr_nsg_id" {
  value = module.acr_nsg.id
}