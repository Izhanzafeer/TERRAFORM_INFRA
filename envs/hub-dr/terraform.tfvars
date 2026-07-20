location = "West US"

gateway_subnet_name = "GatewaySubnet"

firewall_subnet_name = "AzureFirewallSubnet"

bastion_subnet_name = "AzureBastionSubnet"

shared_subnet_name = "SNET-SHR"

hub_dr_resource_group_name = "RG-HUB-DR"

hub_dr_vnet_name = "vnet-hub-dr"

hub_dr_vnet_address_space = ["10.10.0.0/16"]

hub_dr_gateway_subnet_prefix = ["10.10.0.0/27"]

hub_dr_firewall_subnet_prefix = ["10.10.0.32/26"]

hub_dr_bastion_subnet_prefix = ["10.10.0.96/26"]

hub_dr_shared_subnet_prefix = ["10.10.1.0/24"]

hub_dr_firewall_public_ip_name = "pip-hub-dr-firewall"

hub_dr_bastion_public_ip_name = "pip-hub-dr-bastion"

hub_dr_vpn_gateway_public_ip_name = "pip-hub-dr-vpngateway"

hub_dr_firewall_name = "azfw-hub-dr"

hub_dr_firewall_policy_name = "azfw-policy-hub-dr"

hub_dr_bastion_name = "bas-hub-dr"

hub_dr_virtual_network_gateway_name = "vng-hub-dr"

hub_dr_virtual_network_gateway_sku = "VpnGw1"

hub_dr_gateway_type = "Vpn"

hub_dr_vpn_type = "RouteBased"

hub_dr_nic_name = "nic-shr-agent-dr"

hub_dr_vm_name = "vm-shr-agent-dr"

hub_dr_vm_size = "Standard_B2s"

hub_dr_admin_username = "azureadmin"

hub_dr_admin_password = "P@ssw0rd12345!"

hub_dr_shared_nsg_name = "nsg-snet-shr-dr"

tags = {
  Environment = "Hub-DR"
  Project     = "LandingZone"
  ManagedBy   = "Terraform"
}