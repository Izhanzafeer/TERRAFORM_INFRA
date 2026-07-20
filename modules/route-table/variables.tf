variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "bgp_route_propagation_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type = map(string)
}