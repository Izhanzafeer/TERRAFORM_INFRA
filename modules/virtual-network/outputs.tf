output "id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.this.name
}

output "address_space" {
  description = "Address Space"
  value       = azurerm_virtual_network.this.address_space
}