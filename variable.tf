variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  type        = string
  description = "The location/region where the virtual network is created."
}

variable "vnet_name" {
  type        = string
  description = "Name of the VNet."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}

variable "subnets" {
  type = list(object({
    name               = string
    address_prefix     = list(string)
    service_endpoints  = list(string)
  }))
  description = "List of subnets to be created."
}

variable "route_tables" {
  description = "List of route tables and their routes"
  type = list(object({
    name                = string
    routes              = list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = string
    }))
  }))
  default = []
}

variable "network_security_groups" {
  type = list(object({
    name                    = string
    network_security_group_rules = list(object({
      name                        = string
      priority                    = number
      direction                   = string
      access                      = string
      protocol                    = string
      source_port_ranges          = list(string)
      destination_port_ranges     = list(string)
      source_address_prefixes     = list(string)
      destination_address_prefixes= list(string)
      description                 = string
    }))
  }))
  description = "List of network security groups and their associated rules"
}
