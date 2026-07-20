resource "azurerm_route_table" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = var.bgp_route_propagation_enabled

  tags = var.tags
}