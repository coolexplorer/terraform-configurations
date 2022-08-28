resource "random_string" "random" {
  length = 4
  numeric = true
}

resource "azurerm_resource_group" "network_rg" {
  name = "network-resource-group-${random_string.random.result}"
  location = var.location
}