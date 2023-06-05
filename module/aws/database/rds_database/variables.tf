variable "db_name" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "project" {
  type = string
}
