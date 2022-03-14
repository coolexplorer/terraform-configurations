resource "azurerm_virtual_network" "demo" {
  name                = "demo-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "demo-subnet-1" {
  name                 = "demo-subnet-1"
  resource_group_name  = azurerm_resource_group.demo.name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "demo-instance" {
  name                = "demo-instance-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name

  security_rule {
    access                     = "Allow"
    description                = "Http"
    destination_address_prefix = "*"
    destination_port_range     = "80"
    direction                  = "Inbound"
    name                       = "Http"
    priority                   = 1001
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
  }
  security_rule {
    access                     = "Allow"
    description                = "SSH"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    direction                  = "Inbound"
    name                       = "SSH"
    priority                   = 1002
    protocol                   = "Tcp"
    source_address_prefix      = var.ssh-source-address
    source_port_range          = "*"
  }
}