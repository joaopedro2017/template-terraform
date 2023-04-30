locals {
  create_virtual_network = 1
  create_resource_group  = 1
}

variable "company" {
  type    = string
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
    error_message = "Os nomes das Máquinas Virtuais devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "virtual_machine_linux" {
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
    username      = ""
    create        = false
    publisher     = ""
    vm_names      = ["vms"]
    image_name    = ""
    password      = ""
    image_version = ""
    family_type   = ""
  }

  validation {
    condition     = length(distinct(var.virtual_machine_linux["vm_names"])) == length(var.virtual_machine_linux["vm_names"])
    error_message = "A lista de nomes de Máquinas Virtuais contém valores duplicados."
  }

  validation {
    condition     = length(var.virtual_machine_linux.vm_names) > 0 && alltrue([for name in var.virtual_machine_linux.vm_names : length(name) >= 1 && length(name) <= 48])
    error_message = "A lista de nomes de Máquinas Virtuais não pode estar vazia e os nomes devem ter entre 1 e 48 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.virtual_machine_linux.vm_names : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes de contêineres devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "windows_virtual_machine_scale_set" {
  type = object({
    create           = bool
    scale_set_name   = string
    family_type      = string
    image_name       = string
    publisher        = string
    image_version    = string
    username         = string
    password         = string
    number_instances = number
  })

  default = {
    password         = ""
    username         = ""
    create           = false
    publisher        = ""
    scale_set_name   = ""
    number_instances = 1
    image_name       = ""
    image_version    = ""
    family_type      = "Standard_B1s"
  }

  validation {
    condition     = length(var.windows_virtual_machine_scale_set.scale_set_name) >= 3 && length(var.windows_virtual_machine_scale_set.scale_set_name) <= 24
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve ter entre 3 e 24 caracteres."
  }

  validation {
    condition     = can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", var.windows_virtual_machine_scale_set.scale_set_name))
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve conter apenas letras minúsculas e números."
  }

  validation {
    condition     = var.windows_virtual_machine_scale_set.number_instances >= 1 && var.windows_virtual_machine_scale_set.number_instances <= 100
    error_message = "O número de instancias do Conjunto de Escalas da Máquina Virtual deve ser entre 1 a 100 instancias."
  }
}

