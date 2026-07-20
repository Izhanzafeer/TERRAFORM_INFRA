variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ip_configuration_name" {
  type    = string
  default = "internal"
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "tags" {
  type    = map(string)
  default = {}
}