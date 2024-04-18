module "azure_vnet" {
    source = "Terraform_Cloud/modules/azure_vnet/"
    resource_group_name = "Test-1"
    vnet_name = "my-vnet"
    address_space = ["10.0.0.0/16"]
    location = "East US"

    subnets = [
    {
        name               = "subnet1"
        address_prefix     = ["10.0.1.0/24"]
        service_endpoints  = ["Microsoft.Sql", "Microsoft.Storage"]
    },
    {
        name               = "subnet2"
        address_prefix     = ["10.0.2.0/24"]
        service_endpoints  = ["Microsoft.AzureActiveDirectory"]
    }
    ]

    route_tables = [
    {
        name   = "routeTable1"
        routes = [
        {
            name                   = "route1"
            address_prefix         = "0.0.0.0/0"
            next_hop_type          = "Internet"
            next_hop_in_ip_address = null
        }
        ]
    }
    ]

    network_security_groups = [
    {
        name = "nsg1"
        network_security_group_rules = [
        {
            name                        = "AllowHTTP"
            priority                    = 100
            direction                   = "Inbound"
            access                      = "Allow"
            protocol                    = "Tcp"
            source_port_range           = "8080"
            destination_port_range      = "80"
            source_address_prefix       = "*"
            destination_address_prefix  = "*"
            description                 = "Allow HTTP traffic"
        },
        {
            name                        = "AllowHTTPS"
            priority                    = 110
            direction                   = "Inbound"
            access                      = "Allow"
            protocol                    = "Tcp"
            source_port_range           = "8080"
            destination_port_range      = "443"
            source_address_prefix       = "*"
            destination_address_prefix  = "*"
            description                 = "Allow HTTPS traffic"
        }
        ]
    }
    ]
}
