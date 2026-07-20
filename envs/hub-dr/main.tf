####################################################
# Hub-DR Resource Group
####################################################

resource "azurerm_resource_group" "hub_dr_rg" {
  name     = var.hub_dr_resource_group_name
  location = var.location

  tags = var.tags
}

####################################################
# Hub-DR Virtual Network
####################################################

resource "azurerm_virtual_network" "hub_dr_vnet" {
  name                = var.hub_dr_vnet_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  address_space = var.hub_dr_vnet_address_space

  tags = var.tags
}

####################################################
# Hub-DR Subnets
####################################################

resource "azurerm_subnet" "hub_dr_gateway_subnet" {
  name                 = var.gateway_subnet_name
  resource_group_name  = azurerm_resource_group.hub_dr_rg.name
  virtual_network_name = azurerm_virtual_network.hub_dr_vnet.name

  address_prefixes = var.hub_dr_gateway_subnet_prefix
}

resource "azurerm_subnet" "hub_dr_firewall_subnet" {
  name                 = var.firewall_subnet_name
  resource_group_name  = azurerm_resource_group.hub_dr_rg.name
  virtual_network_name = azurerm_virtual_network.hub_dr_vnet.name

  address_prefixes = var.hub_dr_firewall_subnet_prefix
}

resource "azurerm_subnet" "hub_dr_bastion_subnet" {
  name                 = var.bastion_subnet_name
  resource_group_name  = azurerm_resource_group.hub_dr_rg.name
  virtual_network_name = azurerm_virtual_network.hub_dr_vnet.name

  address_prefixes = var.hub_dr_bastion_subnet_prefix
}

resource "azurerm_subnet" "hub_dr_shared_subnet" {
  name                 = var.shared_subnet_name
  resource_group_name  = azurerm_resource_group.hub_dr_rg.name
  virtual_network_name = azurerm_virtual_network.hub_dr_vnet.name

  address_prefixes = var.hub_dr_shared_subnet_prefix
}

####################################################
# Public IPs
####################################################

resource "azurerm_public_ip" "hub_dr_firewall_pip" {
  name                = var.hub_dr_firewall_public_ip_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_public_ip" "hub_dr_bastion_pip" {
  name                = var.hub_dr_bastion_public_ip_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_public_ip" "hub_dr_vpn_gateway_pip" {
  name                = var.hub_dr_vpn_gateway_public_ip_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

####################################################
# Firewall Policy
####################################################

resource "azurerm_firewall_policy" "hub_dr_firewall_policy" {
  name                = var.hub_dr_firewall_policy_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  sku = "Standard"

  tags = var.tags
}

####################################################
# Azure Firewall
####################################################

resource "azurerm_firewall" "hub_dr_firewall" {

  name                = var.hub_dr_firewall_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  firewall_policy_id = azurerm_firewall_policy.hub_dr_firewall_policy.id

  ip_configuration {

    name = "firewall-ipconfig"

    subnet_id = azurerm_subnet.hub_dr_firewall_subnet.id

    public_ip_address_id = azurerm_public_ip.hub_dr_firewall_pip.id

  }

  tags = var.tags
}

resource "azurerm_bastion_host" "hub_dr_bastion" {

  name                = var.hub_dr_bastion_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  ip_configuration {

    name                 = "bastion-ipconfig"
    subnet_id            = azurerm_subnet.hub_dr_bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.hub_dr_bastion_pip.id

  }

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "hub_dr_gateway" {

  name                = var.hub_dr_virtual_network_gateway_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  type     = var.hub_dr_gateway_type
  vpn_type = var.hub_dr_vpn_type
  sku      = var.hub_dr_virtual_network_gateway_sku

  active_active = false
  bgp_enabled   = false

  ip_configuration {

    name = "gateway-ipconfig"

    public_ip_address_id = azurerm_public_ip.hub_dr_vpn_gateway_pip.id
    subnet_id            = azurerm_subnet.hub_dr_gateway_subnet.id

  }

  tags = var.tags
}

####################################################
# Hub-DR Network Interface
####################################################

resource "azurerm_network_interface" "hub_dr_agent_nic" {

  name                = var.hub_dr_nic_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  ip_configuration {

    name                          = "internal"
    subnet_id                     = azurerm_subnet.hub_dr_shared_subnet.id
    private_ip_address_allocation = "Dynamic"

  }

  tags = var.tags
}

####################################################
# Hub-DR Self-Hosted Agent VM
####################################################

resource "azurerm_windows_virtual_machine" "hub_dr_agent_vm" {

  name                = var.hub_dr_vm_name
  resource_group_name = azurerm_resource_group.hub_dr_rg.name
  location            = azurerm_resource_group.hub_dr_rg.location
  size                = var.hub_dr_vm_size

  admin_username = var.hub_dr_admin_username
  admin_password = var.hub_dr_admin_password

  network_interface_ids = [
    azurerm_network_interface.hub_dr_agent_nic.id
  ]

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"

  }

  tags = var.tags
}

####################################################
# Hub-DR Network Security Group
####################################################

resource "azurerm_network_security_group" "hub_dr_shared_nsg" {

  name                = var.hub_dr_shared_nsg_name
  location            = azurerm_resource_group.hub_dr_rg.location
  resource_group_name = azurerm_resource_group.hub_dr_rg.name

  security_rule {

    name      = "Allow-RDP"
    priority  = 100
    direction = "Inbound"
    access    = "Allow"
    protocol  = "Tcp"

    source_port_range      = "*"
    destination_port_range = "3389"

    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  tags = var.tags
}

####################################################
# Hub-DR NSG Association
####################################################

resource "azurerm_subnet_network_security_group_association" "hub_dr_shared_subnet_nsg" {

  subnet_id                 = azurerm_subnet.hub_dr_shared_subnet.id
  network_security_group_id = azurerm_network_security_group.hub_dr_shared_nsg.id

}
