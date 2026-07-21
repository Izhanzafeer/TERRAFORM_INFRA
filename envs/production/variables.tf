variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "aks_subnet_name" {
  type = string
}

variable "aks_subnet_prefix" {
  type = list(string)
}

variable "appgw_subnet_name" {
  type = string
}

variable "appgw_subnet_prefix" {
  type = list(string)
}

variable "private_subnet_name" {
  type = string
}

variable "private_subnet_prefix" {
  type = list(string)
}

variable "data_subnet_name" {
  type = string
}

variable "data_subnet_prefix" {
  type = list(string)
}

variable "acr_subnet_name" {
  type = string
}

variable "acr_subnet_prefix" {
  type = list(string)
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}

variable "route_table_name" {
  type = string
}

variable "log_analytics_name" {
  type = string
}

variable "log_analytics_sku" {
  type    = string
  default = "PerGB2018"
}

variable "retention_in_days" {
  type    = number
  default = 30
}

variable "application_insights_name" {
  type = string
}

variable "application_type" {
  type    = string
  default = "web"
}

variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type    = string
  default = "Premium"
}

variable "acr_admin_enabled" {
  type    = bool
  default = false
}

variable "key_vault_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "key_vault_sku" {
  type    = string
  default = "standard"
}

variable "appgw_public_ip_name" {
  type = string
}

variable "public_ip_sku" {
  type    = string
  default = "Standard"
}

variable "allocation_method" {
  type    = string
  default = "Static"
}

variable "application_gateway_name" {
  type = string
}

variable "application_gateway_capacity" {
  type    = number
  default = 2
}

variable "aks_name" {
  type = string
}

variable "aks_dns_prefix" {
  type = string
}

variable "aks_node_count" {
  type    = number
  default = 2
}

variable "aks_vm_size" {
  type    = string
  default = "Standard_D4s_v5"
}

variable "aks_os_disk_size_gb" {
  type    = number
  default = 128
}

variable "postgres_server_name" {
  type = string
}

variable "postgres_admin_username" {
  type = string
}

variable "postgres_admin_password" {
  type      = string
  sensitive = true
}

variable "postgres_private_dns_zone_name" {
  type = string
}

variable "postgres_version" {
  description = "PostgreSQL Flexible Server version"
  type        = string
  default     = "16"
}

variable "postgres_private_endpoint_name" {
  type = string
}

variable "redis_name" {
  description = "Azure Redis Cache name"
  type        = string
}

variable "redis_capacity" {
  description = "Redis Cache capacity"
  type        = number
  default     = 1
}

variable "redis_family" {
  description = "Redis Cache family"
  type        = string
  default     = "C"
}

variable "redis_sku_name" {
  description = "Redis Cache SKU"
  type        = string
  default     = "Standard"
}

variable "keyvault_diagnostic_name" {
  type    = string
  default = "kv-diagnostics"
}

variable "acr_diagnostic_name" {
  type    = string
  default = "acr-diagnostics"
}

variable "appgw_diagnostic_name" {
  type    = string
  default = "appgw-diagnostics"
}

variable "postgres_diagnostic_name" {
  type    = string
  default = "postgres-diagnostics"
}

variable "aks_nsg_name" {
  type = string
}

variable "appgw_nsg_name" {
  type = string
}

variable "private_nsg_name" {
  type = string
}

variable "data_nsg_name" {
  type = string
}

variable "acr_nsg_name" {
  type = string
}
variable "storage_account_name" {
  description = "Storage Account name"
  type        = string
}
variable "action_group_name" {
  type = string
}

variable "action_group_short_name" {
  type = string
}

variable "action_group_email_receivers" {
  type = list(object({
    name          = string
    email_address = string
  }))
}

variable "allowed_locations_policy_definition_id" {
  type = string
}
variable "network_watcher_name" {
  type = string
}