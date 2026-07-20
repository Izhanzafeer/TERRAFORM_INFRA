output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_id" {
  value = module.virtual_network.id
}

output "firewall_id" {
  value = module.firewall.id
}

output "bastion_id" {
  value = module.bastion.id
}