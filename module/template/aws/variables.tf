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

variable "ec2" {
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




