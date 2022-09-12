resource "random_string" "random" {
  count   = var.name_postfix != null ? 1 : 0
  length  = 4
  numeric = true
  special = false
}

locals {
  postfix = var.name_postfix != null ? var.name_postfix : random_string.random[0].result
}

resource "azurerm_resource_group" "network_rg" {
  name     = "network-rg-${local.postfix}"
  location = var.location
}

resource "azurerm_resource_group" "compute_rg" {
  name     = "compute-rg-${local.postfix}"
  location = var.location
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-rg-${local.postfix}"
  location = var.location
}

resource "azurerm_resource_group" "aks_net_rg" {
  name     = "aks-net-rg-${local.postfix}"
  location = var.location
}
