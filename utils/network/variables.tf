variable "location" {
  type    = string
  default = "Canada Central"
}

variable "network_rg_name" {
  type        = string
  description = "The network resource group name"
}

variable "owner" {
  type        = string
  description = "The owner name"
  default     = "Allen"
}

# Credentials
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
