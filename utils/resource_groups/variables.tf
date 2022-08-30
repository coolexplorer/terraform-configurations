variable "location" {
  type = string
  default = "Canada Central"
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