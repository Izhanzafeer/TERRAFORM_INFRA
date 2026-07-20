resource "azurerm_virtual_network_gateway" "this" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  type     = var.type
  vpn_type = var.vpn_type
  sku      = var.sku

  active_active = var.active_active
  bgp_enabled   = var.bgp_enabled

  ip_configuration {

    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    public_ip_address_id          = var.public_ip_address_id
    private_ip_address_allocation = "Dynamic"

  }

  tags = var.tags
}