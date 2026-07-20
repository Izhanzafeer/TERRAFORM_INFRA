output "id" {
  value = azurerm_firewall.this.id
}

output "name" {
  value = azurerm_firewall.this.name
}

output "private_ip_address" {
  value = azurerm_firewall.this.ip_configuration[0].private_ip_address
}

output "public_ip_address_id" {
  value = azurerm_firewall.this.ip_configuration[0].public_ip_address_id
}