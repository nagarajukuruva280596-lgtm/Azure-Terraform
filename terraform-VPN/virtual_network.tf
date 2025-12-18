provider "azurerm" {
  features {
    
  }
  subscription_id = "1349db56-7a42-446d-bce1-63520d61eccf"
}

resource "azurerm_virtual_network" "myvpn" {
  name = "myvpn"
  address_space = [ "10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
}

resource "azurerm_subnet" "mysubnet" {
    name = "mysubnet"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvpn.name
    address_prefixes = [ "10.0.0.0/24"]
}

data "azurerm_public_ip" "pub-ip" {
    name = "pub-ip"
    resource_group_name = azurerm_resource_group.myrg.name
    
}

resource "azurerm_network_interface" "mynic" {
  name = "nic1"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "static"
    public_ip_address_id = data.azurerm_public_ip.pub-ip.id
  }
}

output "pubic_ip_add" {
  value = data.azurerm_public_ip.pub-ip.name
}