module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {
  source = "../../modules/virtual-network"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

module "gateway_subnet" {
  source = "../../modules/subnet"

  name                 = var.gateway_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.gateway_subnet_prefix
}

module "firewall_subnet" {
  source = "../../modules/subnet"

  name                 = var.firewall_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.firewall_subnet_prefix
}

module "bastion_subnet" {
  source = "../../modules/subnet"

  name                 = var.bastion_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.bastion_subnet_prefix
}

module "shared_subnet" {
  source = "../../modules/subnet"

  name                 = var.shared_subnet_name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = var.shared_subnet_prefix
}

module "firewall_pip" {
  source = "../../modules/public-ip"

  name                = var.firewall_public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "bastion_pip" {
  source = "../../modules/public-ip"

  name                = var.bastion_public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "vpn_gateway_pip" {
  source = "../../modules/public-ip"

  name                = var.vpn_gateway_public_ip_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "firewall_policy" {
  source = "../../modules/firewall-policy"

  name                = var.firewall_policy_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "firewall" {
  source = "../../modules/firewall"

  name                = var.firewall_name
  location            = var.location
  resource_group_name = module.resource_group.name

  firewall_policy_id = module.firewall_policy.id

  subnet_id = module.firewall_subnet.id

  public_ip_address_id = module.firewall_pip.id

  tags = var.tags
}

module "vpn_gateway" {
  source = "../../modules/vpn-gateway"

  name                = var.virtual_network_gateway_name
  location            = var.location
  resource_group_name = module.resource_group.name

  sku      = var.virtual_network_gateway_sku
  type     = var.gateway_type
  vpn_type = var.vpn_type

  subnet_id            = module.gateway_subnet.id
  public_ip_address_id = module.vpn_gateway_pip.id

  tags = var.tags
}

module "bastion" {
  source = "../../modules/bastion-host"

  name                = var.bastion_name
  location            = var.location
  resource_group_name = module.resource_group.name

  subnet_id            = module.bastion_subnet.id
  public_ip_address_id = module.bastion_pip.id

  tags = var.tags
}

module "agent_nic" {
  source = "../../modules/network-interface"

  name                = var.nic_name
  location            = var.location
  resource_group_name = module.resource_group.name

  subnet_id = module.shared_subnet.id

  tags = var.tags
}

module "agent_vm" {
  source = "../../modules/windows-virtual-machine"

  name                = var.vm_name
  location            = var.location
  resource_group_name = module.resource_group.name

  size = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    module.agent_nic.id
  ]

  tags = var.tags
}

module "shared_nsg" {
  source = "../../modules/network-security-group"

  name                = var.shared_nsg_name
  location            = var.location
  resource_group_name = module.resource_group.name

  security_rules = [
    {
      name                       = "Allow-RDP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  tags = var.tags
}

module "shared_subnet_nsg" {
  source = "../../modules/subnet-network-security-group-association"

  subnet_id                 = module.shared_subnet.id
  network_security_group_id = module.shared_nsg.id
}