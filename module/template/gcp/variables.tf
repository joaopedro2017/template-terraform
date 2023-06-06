variable "location" {
  type    = string
  default = "none"
}

variable "project" {
  type    = string
  default = "none"
}

variable "compute_instance" {
  type = object({
    create         = bool
    instance_names = list(string)
    instance_image = string
    machine_type   = string
    location       = string
  })

  default = {
    create         = false
    instance_names = ["instance"]
    instance_image = ""
    machine_type   = ""
    location       = ""
  }
}
