variable "name" {
  description = "Public IP Name"
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

variable "allocation_method" {
  description = "Static or Dynamic"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Standard"
}

variable "zones" {
  description = "Availability Zones"
  type        = list(string)
  default     = []
}

variable "domain_name_label" {
  description = "DNS Label"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}