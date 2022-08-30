resource "random_string" "random" {
  length = 4
  numeric = true
  special = false
}

resource "azurerm_virtual_network" "test_vnet" {
  name = "vnet-${random_string.random.result}"
  location = var.location
  resource_group_name = var.network_rg_name
  address_space = ["10.0.0.0/26"]

  subnet {
    name = "subnet1"
    address_prefix = "10.0.0.0/27"
  }

  subnet {
    name = "subnet2"
    address_prefix = "10.0.0.32/27"
  }

  tags = {
    createdBy = "Allen"
    environment = "test"
  }
}