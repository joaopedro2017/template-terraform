variable "subnet_id" {
  type = string
}

variable "private_ips" {
  type = list(string)
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}
