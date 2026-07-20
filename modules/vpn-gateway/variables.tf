variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "type" {
  type    = string
  default = "Vpn"
}

variable "vpn_type" {
  type    = string
  default = "RouteBased"
}

variable "sku" {
  type = string
}

variable "active_active" {
  type    = bool
  default = false
}

variable "bgp_enabled" {
  type    = bool
  default = false
}

variable "subnet_id" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "ip_configuration_name" {
  type    = string
  default = "gateway-ipconfig"
}

variable "tags" {
  type    = map(string)
  default = {}
}