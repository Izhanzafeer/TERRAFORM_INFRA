resource "azurerm_firewall_policy" "this" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = var.sku

  tags = var.tags
}