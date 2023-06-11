locals {
  create_virtual_network = (
    var.compute_instance["create"] ||
    var.google_compute_autoscaler["create"]
  ) ? 1 : 0
}

variable "location" {
  type    = string
  default = "none"
}

variable "project" {
  type    = string
  default = "none"
}

variable "environment" {
  type    = string
  default = "none"
}

variable "compute_instance" {
  type = object({
    create         = bool
    instance_names = list(string)
    instance_image = string
    machine_type   = string
    zone           = string
  })

  default = {
    create         = false
    instance_names = ["instance"]
    instance_image = ""
    machine_type   = ""
    zone           = ""
  }

  validation {
    condition     = length(var.compute_instance.instance_names) > 0
    error_message = "A lista de instance não pode estar vazia."
  }

  validation {
    condition     = length(distinct(var.compute_instance["instance_names"])) == length(var.compute_instance["instance_names"])
    error_message = "A lista de nomes contém valores duplicados."
  }

  validation {
    condition     = alltrue([for name in var.compute_instance.instance_names : length(name) >= 3 && length(name) <= 63])
    error_message = "Cada nome deve ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.compute_instance.instance_names : can(regex("^[a-z]+(-[a-z0-9]+)*$", name))])
    error_message = "Os nomes dos instance devem conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'."
  }
}


variable "google_compute_autoscaler" {
  type = object({
    create          = bool
    autoscaler_name = string
    machine_type    = string
    instance_image  = string
    min_replicas    = number
    max_replicas    = number
    cooldown_period = number ## nao deve ser menor q 15
    zone            = string
  })

  default = {
    create          = false
    autoscaler_name = "name"
    machine_type    = ""
    instance_image  = ""
    min_replicas    = 0
    max_replicas    = 0
    cooldown_period = 0
    zone            = ""
  }

  validation {
    condition     = length(var.google_compute_autoscaler.autoscaler_name) >= 1 && length(var.google_compute_autoscaler.autoscaler_name) <= 63
    error_message = "O nome do AutoScaler deve ter entre 1 e 63 caracteres."
  }

  validation {
    condition     = can(regex("^[a-z]+(-[a-z0-9]+)*$", var.google_compute_autoscaler.autoscaler_name))
    error_message = "O nome do AutoScaler deve conter apenas letras minúsculas e números."
  }

  validation {
    condition     = var.google_compute_autoscaler.cooldown_period >= 15
    error_message = "O valor do cooldown_period deve ser maior ou igual a 15."
  }

  validation {
    condition     = var.google_compute_autoscaler.min_replicas >= 0
    error_message = "O valor do min_replicas deve ser maior ou igual a 0."
  }

  validation {
    condition     = var.google_compute_autoscaler.max_replicas >= 1
    error_message = "O valor do max_replicas deve ser maior ou igual a 1."
  }

  validation {
    condition     = var.google_compute_autoscaler.max_replicas >= var.google_compute_autoscaler.min_replicas
    error_message = "O valor do max_replicas deve ser maior ou igual ao do min_replicas."
  }
}

variable "app_engine" {
  type = object({
    create = bool
  })

  default = {
    create = false
  }
}

variable "sql_database" {
  type = object({
    create           = bool
    database_names   = list(string)
    database_version = string
    tier             = string
    location         = string
  })

  default = {
    create           = false
    database_names   = ["database"]
    database_version = ""
    tier             = ""
    location         = ""
  }

  validation {
    condition     = length(var.sql_database.database_names) > 0
    error_message = "A lista de databases não pode estar vazia."
  }

  validation {
    condition     = length(distinct(var.sql_database["database_names"])) == length(var.sql_database["database_names"])
    error_message = "A lista de nomes contém valores duplicados."
  }

  validation {
    condition     = alltrue([for name in var.sql_database.database_names : length(name) >= 3 && length(name) <= 63])
    error_message = "Cada nome deve ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.sql_database.database_names : can(regex("^[a-zA-Z0-9_-]+$", name))])
    error_message = "Os nomes dos databases devem conter apenas letras minúsculas, números e os caractere ('-' e '_')."
  }
}

variable "storage_bucket" {
  type = object({
    create       = bool
    bucket_names = list(string)
    location     = string
  })

  default = {
    create       = false
    bucket_names = ["bucket"]
    location     = ""
  }

  validation {
    condition     = length(var.storage_bucket.bucket_names) > 0
    error_message = "A lista de bucket não pode estar vazia."
  }

  validation {
    condition     = length(distinct(var.storage_bucket["bucket_names"])) == length(var.storage_bucket["bucket_names"])
    error_message = "A lista de nomes contém valores duplicados."
  }

  validation {
    condition     = alltrue([for name in var.storage_bucket.bucket_names : length(name) >= 3 && length(name) <= 63])
    error_message = "Cada nome deve ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.storage_bucket.bucket_names : can(regex("^[a-z0-9]+([_-][a-z0-9]+)*$", name))])
    error_message = "Os nomes dos bucket devem conter apenas letras minúsculas, números e os caractere ('-' e '_')."
  }
}

