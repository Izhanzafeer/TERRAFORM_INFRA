resource "azurerm_postgresql_flexible_server" "this" {

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  version = var.postgres_version
  sku_name = var.sku_name

  storage_mb = var.storage_mb

  delegated_subnet_id = var.delegated_subnet_id
  private_dns_zone_id = var.private_dns_zone_id

  zone = var.zone

  backup_retention_days = var.backup_retention_days

  public_network_access_enabled = false

  tags = var.tags
}