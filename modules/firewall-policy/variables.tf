variable "name" {
  description = "Firewall Policy Name"
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

variable "sku" {
  description = "Firewall Policy SKU"
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}