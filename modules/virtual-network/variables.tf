variable "name" {
  description = "Virtual Network Name"
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

variable "address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
}

variable "tags" {
  description = "Resource Tags"
  type        = map(string)
}