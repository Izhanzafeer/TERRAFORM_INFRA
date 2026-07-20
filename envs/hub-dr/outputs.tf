output "hub_dr_vnet_id" {
  value = azurerm_virtual_network.hub_dr_vnet.id
}

output "hub_dr_firewall_id" {
  value = azurerm_firewall.hub_dr_firewall.id
}