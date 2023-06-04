locals {
  create_virtual_network = (
    var.elastic_compute_cloud["create"] ||
    var.autoscaling_group["create"]
  ) ? 1 : 0
}

variable "location" {
  type    = string
  default = "none"
}

variable "environment" {
  type    = string
  default = "none"
}

variable "project" {
  type    = string
  default = "none"
}

variable "access_key" {
  type    = string
  default = "none"
}

variable "secret_key" {
  type    = string
  default = "none"
}

variable "elastic_compute_cloud" {
  type = object({
    create         = bool
    instance_names = list(string)
    ami            = string
    instance_type  = string
    location       = string
    username       = string
    password       = string
  })

  default = {
    create         = false
    instance_names = ["instances"]
    ami            = ""
    instance_type  = ""
    location       = ""
    username       = ""
    password       = ""
  }
}

variable "simple_storage_service" {
  type = object({
    create       = bool
    bucket_names = list(string)
  })

  default = {
    create       = false
    bucket_names = ["bucket"]
  }
}

variable "rds_database" {
  type = object({
    create               = bool
    db_names             = list(string)
    allocated_storage    = number
    engine               = string
    engine_version       = string
    instance_class       = string
    db_username          = string
    db_password          = string
    parameter_group_name = string
  })

  default = {
    create               = false
    db_names             = ["database"]
    allocated_storage    = 0
    engine               = ""
    engine_version       = ""
    instance_class       = ""
    db_username          = ""
    db_password          = ""
    parameter_group_name = ""
  }
}

variable "athena_database" {
  type = object({
    create   = bool
    db_names = list(string)
  })

  default = {
    create   = false
    db_names = ["database"]
  }
}

variable "app_runner" {
  type = object({
    create           = bool
    service_names    = list(string)
    image_identifier = string
    port             = string
  })

  default = {
    create           = false
    service_names    = ["app"]
    image_identifier = ""
    port             = ""
  }
}

variable "beanstalk_application" {
  type = object({
    create            = bool
    application_names = list(string)
  })

  default = {
    create            = false
    application_names = ["app"]
  }
}

variable "autoscaling_group" {
  type = object({
    create           = bool
    group_name       = string
    ami              = string
    instance_type    = string
    desired_capacity = number
    min_size         = number
    max_size         = number
    location         = string
  })

  default = {
    create           = false
    group_name       = ""
    ami              = ""
    instance_type    = ""
    desired_capacity = 0
    min_size         = 0
    max_size         = 0
    location         = ""
  }
}
