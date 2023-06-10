variable "autoscaler_name" {
  type = string
}

variable "zone" {
  type =  string
}

variable "max_replicas" {
  type = number
}

variable "min_replicas" {
  type = number
}

variable "cooldown_period" {
  type = number
}

variable "machine_type" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "network_self_link" {
  type = string
}

variable "subnetwork_self_link" {
  type = string
}

variable "project" {
  type = string
}
