resource "azurerm_lb" "demo" {
  name                = "demo-loadbalancer"
  resource_group_name = azurerm_resource_group.demo.name
  sku                 = length(var.zones) == 0 ? "Basic" : "Standard"
  location            = var.location

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.demo.id
  }
}

resource "azurerm_public_ip" "demo" {
  name                = "demo-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.demo.name
  allocation_method   = "Static"
  domain_name_label   = azurerm_resource_group.demo.name
  sku                 = length(var.zones) == 0 ? "Basic" : "Standard"
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
  name            = "BackendAddressPool"
  loadbalancer_id = azurerm_lb.demo.id
}

resource "azurerm_lb_nat_pool" "lbnatpool" {
  resource_group_name            = azurerm_resource_group.demo.name
  name                           = "ssh"
  loadbalancer_id                = azurerm_lb.demo.id
  protocol                       = "Tcp"
  frontend_port_start            = 50000
  frontend_port_end              = 50119
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"
}

resource "azurerm_lb_probe" "demo" {
  name                = "http-probe"
  resource_group_name = azurerm_resource_group.demo.name
  loadbalancer_id     = azurerm_lb.demo.id
  protocol            = "Http"
  request_path        = "/"
  port                = 80
}

resource "azurerm_lb_rule" "demo" {
  name                           = "LBRule"
  resource_group_name            = azurerm_resource_group.demo.name
  loadbalancer_id                = azurerm_lb.demo.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.demo.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpepool.id]
}