data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

resource "azurerm_subnet" "subnets" {
  for_each             = { for s in var.subnets : s.name => s }
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  name                 = each.value.name
  address_prefixes     = each.value.address_prefix
  service_endpoints    = each.value.service_endpoints
}

resource "azurerm_route_table" "route_table" {
  for_each = { for rt in var.route_tables : rt.name => rt }
  name                = each.value.name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  dynamic "route" {
    for_each = each.value.routes
    content {
      name                   = route.value.name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_in_ip_address
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = { for nsg in var.network_security_groups : nsg.name => nsg }
  name                = each.value.name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name

  dynamic "security_rule" {
    for_each = each.value.network_security_group_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
      description                = security_rule.value.description
    }
  }
}
