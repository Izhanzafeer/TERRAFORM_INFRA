resource "azurerm_windows_virtual_machine" "this" {

  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  size = var.size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = var.network_interface_ids

  os_disk {

    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type

  }

  source_image_reference {

    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version

  }

  tags = var.tags
}