variable "location" {
  type        = string
  description = "Azure Region name"
  default     = "Canada Central"
}

variable "name_prefix" {
  type        = string
  description = "The AKS name's prefix"
  default     = "test-aks"
}

# AKS
variable "kubernetes_version" {
  type    = string
  default = "1.22.6"
}

variable "aks_rg_name" {
  type        = string
  description = "The AKS resource group name"
}

variable "aks_net_rg_name" {
  type        = string
  description = "The AKS network resource group name"
}

variable "worker_node_vm_size" {
  type        = string
  default     = "Standard_D2_v2"
  description = "The work node count"
}

variable "worker_node_count" {
  type        = number
  default     = 1
  description = "The worker node count"
}

variable "worker_node_pool_name" {
  type        = string
  default     = "nodepool1"
  description = "The work node pool name"
}

variable "identity" {
  type    = string
  default = "SystemAssigned"
}

# Network
variable "aks_vnet_name" {
  type        = string
  description = "The aks virtual network name"
}

variable "aks_subnet_name" {
  type        = string
  description = "The aks subnet name"
  default     = "subnet1"
}

variable "aks_network_plugin" {
  type        = string
  description = "The network plugin for AKS"
  default     = "kubenet"
}

# Credential
variable "azure_client_id" {
  sensitive = true
}

variable "azure_tenant_id" {
  sensitive = true
}

variable "azure_subscription_id" {
  sensitive = true
}

variable "azure_client_secret" {
  sensitive = true
}

variable "azure_client_secret_id" {
  sensitive = true
}
