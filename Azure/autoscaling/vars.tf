variable "location" {
  type    = string
  default = "westus2"
}

variable "zones" {
  type    = list(string)
  default = []
}

variable "ssh-source-address" {
  type    = string
  default = "*"
}