variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

####################################################
# Subnets
####################################################

variable "gateway_subnet_name" {
  type = string
}

variable "gateway_subnet_prefix" {
  type = list(string)
}

variable "firewall_subnet_name" {
  type = string
}

variable "firewall_subnet_prefix" {
  type = list(string)
}

variable "bastion_subnet_name" {
  type = string
}

variable "bastion_subnet_prefix" {
  type = list(string)
}

variable "shared_subnet_name" {
  type = string
}

variable "shared_subnet_prefix" {
  type = list(string)
}

####################################################
# Public IP
####################################################

variable "firewall_public_ip_name" {
  type = string
}

variable "bastion_public_ip_name" {
  type = string
}

variable "vpn_gateway_public_ip_name" {
  type = string
}

####################################################
# Firewall
####################################################

variable "firewall_name" {
  type = string
}

variable "firewall_policy_name" {
  type = string
}

####################################################
# VPN Gateway
####################################################

variable "virtual_network_gateway_name" {
  type = string
}

variable "virtual_network_gateway_sku" {
  type = string
}

variable "gateway_type" {
  type = string
}

variable "vpn_type" {
  type = string
}

####################################################
# Bastion
####################################################

variable "bastion_name" {
  type = string
}

####################################################
# VM
####################################################

variable "nic_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

####################################################
# NSG
####################################################

variable "shared_nsg_name" {
  type = string
}

####################################################
# Tags
####################################################

variable "tags" {
  type = map(string)
}