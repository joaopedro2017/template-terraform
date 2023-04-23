locals {
  create_virtual_network = 1
  create_resource_group = 1
}

variable "company" {
    type = string
    default = "none"
}

variable "name" {
   type    = string
  default = "none"
}

variable "location" {
  type    = string
  default = "none"
}
