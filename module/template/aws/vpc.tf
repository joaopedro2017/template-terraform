module "vpc" {
  source      = "../../aws/networking/vpc"
  cidr_block  = "172.16.0.0/16"
  environment = var.environment
  project     = var.project
}