resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier

  min_tls_version                 = "TLS1_2"
  public_network_access_enabled   = var.public_network_access_enabled
  allow_nested_items_to_be_public = false

  https_traffic_only_enabled = true

  tags = var.tags
}