resource "random_string" "random" {
  length  = 4
  numeric = true
  special = false
}

resource "azurerm_resource_group" "network_rg" {
  name     = "network-rg-${random_string.random.result}"
  location = var.location
}

resource "azurerm_resource_group" "compute_rg" {
  name     = "compute-rg-${random_string.random.result}"
  location = var.location
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-rg-${random_string.random.result}"
  location = var.location
}
