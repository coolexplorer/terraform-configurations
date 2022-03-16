resource "azurerm_resource_group" "demo" {
  name     = "mysql-demo"
  location = var.location
}