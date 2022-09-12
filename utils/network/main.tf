resource "random_string" "random" {
  count   = var.name_postfix != null ? 1 : 0
  length  = 4
  numeric = true
  special = false
}

locals {
  postfix = var.name_postfix != null ? var.name_postfix : random_string.random[0].result
}

resource "azurerm_virtual_network" "vm_vnet" {
  name                = "vm-vnet-${local.postfix}"
  location            = var.location
  resource_group_name = var.network_rg_name
  address_space       = ["10.0.0.0/26"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.0.0/27"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.0.32/27"
  }

  tags = {
    createdBy   = var.owner
    environment = "test"
  }
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet-${local.postfix}"
  location            = var.location
  resource_group_name = var.network_rg_name
  address_space       = ["10.1.0.0/21"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.1.0.0/22"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.1.4.0/22"
  }

  tags = {
    createdBy   = var.owner
    environment = "test"
  }
}
