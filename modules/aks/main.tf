resource "azurerm_kubernetes_cluster" "this" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = var.dns_prefix

  sku_tier = var.sku_tier

  default_node_pool {

    name                = "system"
    node_count          = var.node_count
    vm_size             = var.vm_size
    vnet_subnet_id      = var.subnet_id
    os_disk_size_gb     = var.os_disk_size_gb
    auto_scaling_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    load_balancer_sku = "standard"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  tags = var.tags
}