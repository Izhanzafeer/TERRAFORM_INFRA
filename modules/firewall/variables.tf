variable "name" {
  description = "Firewall Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "sku_name" {
  description = "Firewall SKU Name"
  type        = string
  default     = "AZFW_VNet"
}

variable "sku_tier" {
  description = "Firewall SKU Tier"
  type        = string
  default     = "Standard"
}

variable "firewall_policy_id" {
  description = "Firewall Policy ID"
  type        = string
}

variable "subnet_id" {
  description = "Firewall Subnet ID"
  type        = string
}

variable "public_ip_address_id" {
  description = "Firewall Public IP ID"
  type        = string
}

variable "ip_configuration_name" {
  description = "IP Configuration Name"
  type        = string
  default     = "firewall-ipconfig"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}