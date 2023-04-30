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

variable "linux_virtual_machine_scale_set" {
  type = object({
    create           = bool
    scale_set_name   = string
    family_type      = string
    image_name       = string
    image_version    = string
    username         = string
    password         = string
    publisher        = string
    number_instances = number
  })

  default = {
    username         = ""
    create           = false
    scale_set_name   = ""
    number_instances = 1
    image_name       = ""
    publisher        = ""
    password         = ""
    image_version    = ""
    family_type      = "Standard_B1s"
  }

  validation {
    condition     = length(var.linux_virtual_machine_scale_set.scale_set_name) >= 3 && length(var.linux_virtual_machine_scale_set.scale_set_name) <= 24
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve ter entre 3 e 24 caracteres."
  }

  validation {
    condition     = can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", var.linux_virtual_machine_scale_set.scale_set_name))
    error_message = "O nome do Conjunto de Escalas da Máquina Virtual deve conter apenas letras minúsculas e números."
  }

  validation {
    condition     = var.linux_virtual_machine_scale_set.number_instances >= 1 && var.linux_virtual_machine_scale_set.number_instances <= 100
    error_message = "O número de instancias do Conjunto de Escalas da Máquina Virtual deve ser entre 1 a 100 instancias."
  }
}

variable "windows_web_app" {
  type = object({
    create           = bool
    app_names        = list(string)
    family_plan      = string
    number_instances = number
  })

  default = {
    create           = false
    app_names        = ["app"]
    family_plan      = ""
    number_instances = 1
  }

  validation {
    condition     = length(distinct(var.windows_web_app["app_names"])) == length(var.windows_web_app["app_names"])
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.windows_web_app.app_names) > 0 && alltrue([for name in var.windows_web_app.app_names : length(name) >= 3 && length(name) <= 63])
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.windows_web_app.app_names : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = var.windows_web_app.number_instances >= 1 && var.windows_web_app.number_instances <= 30
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }
}

variable "linux_web_app" {
  type = object({
    create           = bool
    app_names        = list(string)
    family_plan      = string
    number_instances = number
  })

  default = {
    create           = false
    app_names        = ["app"]
    family_plan      = ""
    number_instances = 1
  }

  validation {
    condition     = length(distinct(var.linux_web_app["app_names"])) == length(var.linux_web_app["app_names"])
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.linux_web_app.app_names) > 0 && alltrue([for name in var.linux_web_app.app_names : length(name) >= 3 && length(name) <= 63])
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.linux_web_app.app_names : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = var.linux_web_app.number_instances >= 1 && var.linux_web_app.number_instances <= 30
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }
}

variable "windows_function_app" {
  type = object({
    create           = bool
    function_names   = list(string)
    storage_name     = string
    family_plan      = string
    number_instances = number
  })

  default = {
    create           = false
    function_names   = []
    storage_name     = "storage"
    family_plan      = ""
    number_instances = 0
  }

  validation {
    condition     = length(distinct(var.windows_function_app["function_names"])) == length(var.windows_function_app["function_names"])
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.windows_function_app.function_names) > 0 && alltrue([for name in var.windows_function_app.function_names : length(name) >= 3 && length(name) <= 63])
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.windows_function_app.function_names : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = var.windows_function_app.number_instances >= 1 && var.windows_function_app.number_instances <= 30
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }

  validation {
    condition     = length(var.windows_function_app.storage_name) >= 3 && length(var.windows_function_app.storage_name) <= 24
    error_message = "O nome do Storage para a Function deve ter entre 3 e 24 caracteres."
  }
}

variable "linux_function_app" {
  type = object({
    create           = bool
    function_names   = list(string)
    storage_name     = string
    family_plan      = string
    number_instances = number
  })

  default = {
    create           = false
    function_names   = []
    storage_name     = "storage"
    family_plan      = ""
    number_instances = 0
  }

  validation {
    condition     = length(distinct(var.linux_function_app["function_names"])) == length(var.linux_function_app["function_names"])
    error_message = "A lista de Apps contém valores duplicados."
  }

  validation {
    condition     = length(var.linux_function_app.function_names) > 0 && alltrue([for name in var.linux_function_app.function_names : length(name) >= 3 && length(name) <= 63])
    error_message = "A lista de Apps não pode estar vazia e os nomes devem ter entre 3 e 63 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.linux_function_app.function_names : can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", name))])
    error_message = "Os nomes dos Apps devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }

  validation {
    condition     = var.linux_function_app.number_instances >= 1 && var.linux_function_app.number_instances <= 30
    error_message = "O número de instancias do Plan-Apps deve ser entre 1 a 30 instancias."
  }

  validation {
    condition     = length(var.linux_function_app.storage_name) >= 3 && length(var.linux_function_app.storage_name) <= 24
    error_message = "O nome do Storage para a Function deve ter entre 3 e 24 caracteres."
  }
}

variable "mssql_database" {
  type = object({
    create         = bool
    database_names = list(string)
    collation      = string
    family_type    = string
    max_size_gb    = number
    admin_login    = string
    admin_password = string
  })

  default = {
    create         = false
    database_names = ["database"]
    collation      = ""
    family_type    = ""
    max_size_gb    = 0
    admin_login    = ""
    admin_password = ""
  }

  validation {
    condition     = length(distinct(var.mssql_database["database_names"])) == length(var.mssql_database["database_names"])
    error_message = "A lista de bancos contém valores duplicados."
  }

  validation {
    condition     = length(var.mssql_database.database_names) > 0 && alltrue([for name in var.mssql_database.database_names : length(name) >= 1 && length(name) <= 128])
    error_message = "A lista de bancos não pode estar vazia e os nomes devem ter entre 1 e 128 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.mssql_database.database_names : can(regex("^[a-zA-Z0-9_-]+$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "mariadb_database" {
  type = object({
    create         = bool
    database_names = list(string)
    family_type    = string
    collation      = string
    storage_mb     = number
    admin_login    = string
    admin_password = string
  })

  default = {
    create         = false
    database_names = ["database"]
    family_type    = ""
    collation      = ""
    storage_mb     = 0
    admin_login    = ""
    admin_password = ""
  }

  validation {
    condition     = length(distinct(var.mariadb_database["database_names"])) == length(var.mariadb_database["database_names"])
    error_message = "A lista de bancos contém valores duplicados."
  }

  validation {
    condition     = length(var.mariadb_database.database_names) > 0 && alltrue([for name in var.mariadb_database.database_names : length(name) >= 1 && length(name) <= 128])
    error_message = "A lista de bancos não pode estar vazia e os nomes devem ter entre 1 e 128 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.mariadb_database.database_names : can(regex("^[a-zA-Z0-9_-]+$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}

variable "mysql_database" {
  type = object({
    create         = bool
    database_names = list(string)
    family_type    = string
    collation      = string
    storage_mb     = number
    admin_login    = string
    admin_password = string
  })

  default = {
    create         = false
    database_names = ["database"]
    family_type    = ""
    collation      = ""
    storage_mb     = 0
    admin_login    = ""
    admin_password = ""
  }

  validation {
    condition     = length(distinct(var.mysql_database["database_names"])) == length(var.mysql_database["database_names"])
    error_message = "A lista de bancos contém valores duplicados."
  }

  validation {
    condition     = length(var.mysql_database.database_names) > 0 && alltrue([for name in var.mysql_database.database_names : length(name) >= 1 && length(name) <= 128])
    error_message = "A lista de bancos não pode estar vazia e os nomes devem ter entre 1 e 128 caracteres."
  }

  validation {
    condition     = alltrue([for name in var.mysql_database.database_names : can(regex("^[a-zA-Z0-9_-]+$", name))])
    error_message = "Os nomes dos bancos devem conter apenas letras minúsculas, números e o caractere '-' e não pode começar ou terminar com '-'."
  }
}
