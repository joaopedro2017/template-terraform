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
    zone       = string
  })

  default = {
    create         = false
    instance_names = ["instance"]
    instance_image = ""
    machine_type   = ""
    zone       = ""
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
    condition     = alltrue([for name in var.compute_instance.instance_names : can(regex("^[a-z0-9]+(-[a-z0-9]+)*$", name))])
    error_message = "Os nomes dos instance devem conter apenas letras minúsculas, números e o caractere '-' e não podem começar ou terminar com '-'."
  }
}
