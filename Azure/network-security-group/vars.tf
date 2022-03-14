variable "location" {
  type        = string
  default     = "westus2"
  description = "Azure resource location"
}

variable "prefix" {
  type    = string
  default = "demo"
}

variable "ssh-source-address" {
  type    = string
  default = "*"
}
