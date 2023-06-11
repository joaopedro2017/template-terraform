locals {
  create_virtual_network = (
    var.elastic_compute_cloud["create"] ||
    var.autoscaling_group["create"] ||
    var.rds_database["create"]
  ) ? 1 : 0
}

variable "aws_authentication" {

  type = object({
    project     = string
    environment = string
    access_key  = string
    secret_key  = string
    region      = string
  })

  default = {
    project     = ""
    environment = ""
    access_key  = ""
    secret_key  = ""
    region      = ""
  }
}

variable "elastic_compute_cloud" {
  type = object({
    create         = bool
    instance_names = list(string)
    ami            = string
    instance_type  = string
    region         = string
    username       = string
    password       = string
  })

  default = {
    create         = false
    instance_names = ["instances"]
    ami            = ""
    instance_type  = ""
    region         = ""
    username       = ""
    password       = ""
  }

  validation {
    condition     = length(distinct(var.elastic_compute_cloud["instance_names"])) == length(var.elastic_compute_cloud["instance_names"])
    error_message = "A lista de nomes contém valores duplicados."
  }

  validation {
    condition     = length(var.elastic_compute_cloud.instance_names) > 0 && length(var.elastic_compute_cloud.instance_names) <= 32
    error_message = "O número de instancias deve ser entre 1 a 32 instancias."
  }

  validation {
    condition     = length(var.elastic_compute_cloud.instance_names) > 0
    error_message = "A lista de instancias não pode estar vazia."
  }

  validation {
    condition     = alltrue([for name in var.elastic_compute_cloud.instance_names : length(name) >= 3 && length(name) <= 128])
    error_message = "Cada nome deve ter entre 3 e 128 caracteres."
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

  validation {
    condition     = length(var.simple_storage_service.bucket_names) > 0
    error_message = "A lista de bucket não pode estar vazia."
  }

  validation {
    condition     = length(distinct(var.simple_storage_service["bucket_names"])) == length(var.simple_storage_service["bucket_names"])
    error_message = "A lista de nomes contém valores duplicados."
  }

  validation {
    condition     = alltrue([for name in var.simple_storage_service.bucket_names : length(name) >= 3 && length(name) <= 63])
    error_message = "Cada nome deve ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.simple_storage_service.bucket_names : can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", name))])
    error_message = "Os nomes dos bucket devem conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'."
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
    region               = string
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
    region               = ""
  }

  validation {
    condition     = length(var.rds_database.db_names) > 0
    error_message = "A lista de dn_names não pode estar vazia."
  }

  validation {
    condition     = length(distinct(var.rds_database["db_names"])) == length(var.rds_database["db_names"])
    error_message = "A lista de nomes contém valores duplicados."
  }

  validation {
    condition     = alltrue([for name in var.rds_database.db_names : length(name) >= 3 && length(name) <= 63])
    error_message = "Cada nome deve ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.rds_database.db_names : can(regex("^[a-zA-Z0-9]*$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'."
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

  validation {
    condition     = length(var.athena_database.db_names) > 0
    error_message = "A lista de dn_names não pode estar vazia."
  }

  validation {
    condition     = length(distinct(var.athena_database["db_names"])) == length(var.athena_database["db_names"])
    error_message = "A lista de nomes contém valores duplicados."
  }

  validation {
    condition     = alltrue([for name in var.athena_database.db_names : length(name) >= 3 && length(name) <= 32])
    error_message = "Cada nome deve ter entre 3 e 32 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.athena_database.db_names : can(regex("^[a-zA-Z0-9_]*$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '_'."
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

  validation {
    condition     = length(var.app_runner.service_names) > 0
    error_message = "A lista de runner não pode estar vazia."
  }

  validation {
    condition     = alltrue([for name in var.app_runner.service_names : length(name) >= 3 && length(name) <= 40])
    error_message = "Cada nome deve ter entre 3 e 40 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.app_runner.service_names : can(regex("^[a-zA-Z0-9][a-zA-Z0-9_-]*$", name))])
    error_message = "Os nomes dos runner devem conter apenas letras minúsculas, números e os caracteres: '-' e '_'; também não deve iniciar com '-' ou '_'."
  }

  validation {
    condition     = length(var.app_runner.service_names) > 0 && length(var.app_runner.service_names) <= 30
    error_message = "O número de runner deve ser entre 1 a 30."
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

  validation {
    condition     = length(var.beanstalk_application.application_names) > 0
    error_message = "A lista de application não pode estar vazia."
  }

  validation {
    condition     = alltrue([for name in var.beanstalk_application.application_names : can(regex("^[a-zA-Z0-9_-]*$", name))])
    error_message = "Os nomes dos application devem conter apenas letras minúsculas, números e os caracteres: '-' e '_'."
  }

  validation {
    condition     = alltrue([for name in var.beanstalk_application.application_names : length(name) >= 3 && length(name) <= 100])
    error_message = "Cada nome deve ter entre 3 e 100 caracteres."
  }

  validation {
    condition     = length(var.beanstalk_application.application_names) > 0 && length(var.beanstalk_application.application_names) <= 30
    error_message = "O número de application deve ser entre 1 a 30."
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
    region           = string
  })

  default = {
    create           = false
    group_name       = ""
    ami              = ""
    instance_type    = ""
    desired_capacity = 0
    min_size         = 0
    max_size         = 0
    region           = ""
  }

  validation {
    condition     = var.autoscaling_group.desired_capacity >= 0 && var.autoscaling_group.desired_capacity <= 32
    error_message = "O número de instancias em execução no Grupo AutoScaling deve ser entre 0 a 32 instancias, forneça um valor diferente para desired_capacity."
  }

  validation {
    condition     = var.autoscaling_group.max_size >= 0 && var.autoscaling_group.max_size <= 32
    error_message = "O número máximo de instancias do Grupo AutoScaling deve ser entre 0 a 32 instancias."
  }

  validation {
    condition     = var.autoscaling_group.min_size >= 0 && var.autoscaling_group.min_size <= var.autoscaling_group.max_size
    error_message = "O número mínimo de instancias do Grupo AutoScaling deve ser maior que 0 e menor que o número máximo."
  }

  validation {
    condition     = var.autoscaling_group.desired_capacity >= var.autoscaling_group.min_size && var.autoscaling_group.desired_capacity <= var.autoscaling_group.max_size
    error_message = "O número mínimo de instancias em execução do Grupo AutoScaling deve estar entre o número mínimo e máximo."
  }
}
