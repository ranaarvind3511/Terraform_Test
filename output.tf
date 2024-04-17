output "virtual_network_id" {
  value       = azurerm_virtual_network.virtual_network.id
  description = "The resource ID of the Virtual Network."
}

output "subnet_ids" {
  value = {
    for s in azurerm_subnet.subnets : s.name => s.id
  }
  description = "The resource IDs of the subnets."
}

output "route_table_ids" {
  value = {
    for rt in azurerm_route_table.route_table : rt.name => rt.id
  }
  description = "The resource IDs of the route tables."
}

output "network_security_group_ids" {
  value = {
    for nsg in azurerm_network_security_group.nsg : nsg.id => nsg.id
  }
  description = "The resource IDs of the network security groups."
}
