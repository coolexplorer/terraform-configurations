data "azurerm_resource_group" "test_aks_rg" {
  name = var.aks_rg_name
}

data "azurerm_resource_group" "test_aks_net_rg" {
  name = var.aks_net_rg_name
}

data "azurerm_virtual_network" "aks_vnet" {
  name                = var.aks_vnet_name
  resource_group_name = data.azurerm_resource_group.test_aks_net_rg.name
}

data "azurerm_subnet" "aks_subnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = data.azurerm_virtual_network.aks_vnet.name
  resource_group_name  = data.azurerm_resource_group.test_aks_net_rg.name
}

module "test_aks" {
  source = "github.com/coolexplorer/azure-aks"

  name_prefix = var.name_prefix
  location    = var.location

  # AKS
  kubernetes_version = var.kubernetes_version
  aks_rg             = data.azurerm_resource_group.test_aks_rg

  # Worker node pool
  worker_node_pool_name = var.worker_node_pool_name
  worker_node_count     = var.worker_node_count
  worker_node_vm_size   = var.worker_node_vm_size

  # AKS Identity
  identity = var.identity

  # Network
  aks_subnet = data.azurerm_subnet.aks_subnet
}
