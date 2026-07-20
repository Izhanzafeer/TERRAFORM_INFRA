variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "gateway_subnet_name" {
  type = string
}

variable "firewall_subnet_name" {
  type = string
}

variable "bastion_subnet_name" {
  type = string
}

variable "shared_subnet_name" {
  type = string
}

variable "hub_dr_resource_group_name" {
  type = string
}

variable "hub_dr_vnet_name" {
  type = string
}

variable "hub_dr_vnet_address_space" {
  type = list(string)
}

variable "hub_dr_gateway_subnet_prefix" {
  type = list(string)
}

variable "hub_dr_firewall_subnet_prefix" {
  type = list(string)
}

variable "hub_dr_bastion_subnet_prefix" {
  type = list(string)
}

variable "hub_dr_shared_subnet_prefix" {
  type = list(string)
}

variable "hub_dr_firewall_public_ip_name" {
  type = string
}

variable "hub_dr_bastion_public_ip_name" {
  type = string
}

variable "hub_dr_vpn_gateway_public_ip_name" {
  type = string
}

variable "hub_dr_firewall_name" {
  type = string
}

variable "hub_dr_firewall_policy_name" {
  type = string
}

variable "hub_dr_bastion_name" {
  type = string
}

variable "hub_dr_virtual_network_gateway_name" {
  type = string
}

variable "hub_dr_virtual_network_gateway_sku" {
  type = string
}

variable "hub_dr_gateway_type" {
  type = string
}

variable "hub_dr_vpn_type" {
  type = string
}

variable "hub_dr_nic_name" {
  type = string
}

variable "hub_dr_vm_name" {
  type = string
}

variable "hub_dr_vm_size" {
  type = string
}

variable "hub_dr_admin_username" {
  type = string
}

variable "hub_dr_admin_password" {
  type      = string
  sensitive = true
}

variable "hub_dr_shared_nsg_name" {
  type = string
}