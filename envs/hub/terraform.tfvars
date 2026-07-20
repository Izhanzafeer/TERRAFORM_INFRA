resource_group_name = "RG-HUB"
location            = "West US"
vnet_name           = "vnet-hub"
vnet_address_space  = ["10.0.0.0/16"]

gateway_subnet_name   = "GatewaySubnet"
gateway_subnet_prefix = ["10.0.1.0/24"]

firewall_subnet_name   = "AzureFirewallSubnet"
firewall_subnet_prefix = ["10.0.2.0/24"]

bastion_subnet_name   = "AzureBastionSubnet"
bastion_subnet_prefix = ["10.0.3.0/24"]

shared_subnet_name   = "SharedSubnet"
shared_subnet_prefix = ["10.0.4.0/24"]

firewall_public_ip_name    = "pip-firewall"
bastion_public_ip_name     = "pip-bastion"
vpn_gateway_public_ip_name = "pip-vpn-gateway"

firewall_name        = "hub-firewall"
firewall_policy_name = "hub-firewall-policy"

virtual_network_gateway_name = "hub-vpn-gateway"
virtual_network_gateway_sku  = "VpnGw1"

gateway_type = "Vpn"
vpn_type     = "RouteBased"

bastion_name = "hub-bastion"

nic_name = "hub-agent-nic"
vm_name  = "hub-agent-vm"
vm_size  = "Standard_B2s"

admin_username = "azureuser"
admin_password = "ChangeThisToAStrongPassword!"

shared_nsg_name = "NSG-SHARED"

tags = {
  Environment = "Hub"
  Project     = "AIS"
  ManagedBy   = "Terraform"
}