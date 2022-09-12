variable "location" {
  type    = string
  default = "Canada Central"
}

variable "owner" {
  type        = string
  description = "The owner name"
  default     = "Allen"
}

variable "name_postfix" {
  type        = string
  description = "The name postfix that the lenght is limited by 4 characters"
  default     = null
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
