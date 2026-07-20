subscription_id = "54ff4cf6-32b8-4112-ac42-05a514813214"

location = "West US"

resource_group_name = "RG-PRODUCTION"

vnet_name = "Prod-VNet"

vnet_address_space = [
  "10.20.0.0/16"
]

aks_subnet_name = "SNET-AKS"
aks_subnet_prefix = [
  "10.20.1.0/24"
]

appgw_subnet_name = "SNET-APPGW"
appgw_subnet_prefix = [
  "10.20.2.0/24"
]

private_subnet_name = "SNET-PVT"
private_subnet_prefix = [
  "10.20.3.0/24"
]

data_subnet_name = "SNET-DATA"
data_subnet_prefix = [
  "10.20.4.0/24"
]

acr_subnet_name = "SNET-ACR"
acr_subnet_prefix = [
  "10.20.5.0/24"
]

tags = {
  Environment = "Production"
  Project     = "AIS"
  ManagedBy   = "Terraform"
}

route_table_name = "RT-PRODUCTION"

log_analytics_name = "law-production"

log_analytics_sku = "PerGB2018"

retention_in_days = 30

application_insights_name = "appi-production"

application_type = "web"

acr_name = "acrproduction001"

acr_sku = "Premium"

acr_admin_enabled = false

key_vault_name = "kv-production-001"

tenant_id = "75f2a99b-01fd-48f2-ac60-d4a7a44fd0cc"

key_vault_sku = "standard"

appgw_public_ip_name = "pip-appgw-production"

public_ip_sku = "Standard"

allocation_method = "Static"

application_gateway_name = "agw-production"

application_gateway_capacity = 2

aks_name = "aks-production"

aks_dns_prefix = "aksprod"

aks_node_count = 2

aks_vm_size = "Standard_D4s_v5"

aks_os_disk_size_gb = 128

postgres_server_name = "psql-production"

postgres_admin_username = "pgadmin"

postgres_admin_password = "ChangeThisToAStrongPassword!"

postgres_private_dns_zone_name = "privatelink.postgres.database.azure.com"

postgres_private_endpoint_name = "pep-postgresql"

redis_name = "redis-production"

redis_capacity = 1

redis_family = "C"

redis_sku_name = "Standard"

keyvault_diagnostic_name = "kv-diagnostics"

acr_diagnostic_name = "acr-diagnostics"

appgw_diagnostic_name = "appgw-diagnostics"

postgres_diagnostic_name = "postgres-diagnostics"

aks_nsg_name = "NSG-AKS"

appgw_nsg_name = "NSG-APPGW"

private_nsg_name = "NSG-PRIVATE"

data_nsg_name = "NSG-DATA"

acr_nsg_name = "NSG-ACR"