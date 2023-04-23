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

variable "virtual_machine_windows" {
  type = object({
    create        = bool
    vm_names      = list(string)
    family_type   = string
    publisher     = string
    image_name    = string
    image_version = string
    username      = string
    password      = string
  })

  default = {
    create        = false
    vm_names      = ["vms"]
    family_type   = ""
    publisher     = ""
    image_version = ""
    image_name    = ""
    username      = ""
    password      = ""
  }

  validation {
    condition     = length(distinct(var.virtual_machine_windows["vm_names"])) == length(var.virtual_machine_windows["vm_names"])
    error_message = "A lista de nomes de Máquinas Virtuais contém valores duplicados."
  }

  validation {
    condition     = length(var.virtual_machine_windows.vm_names) > 0 && alltrue([for name in var.virtual_machine_windows.vm_names : length(name) >= 1 && length(name) <= 48])
    error_message = "A lista de nomes de Máquinas Virtuais não pode estar vazia e os nomes devem ter entre 1 e 48 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.virtual_machine_windows.vm_names : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes de contêineres devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}
