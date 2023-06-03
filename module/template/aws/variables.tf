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

variable  "athena_database" {
  type = object({
    create               = bool
    db_names             = list(string)
  })

  default = {
    create               = false
    db_names             = ["database"]
  }
}
