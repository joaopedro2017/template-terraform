module "vpc" {
  source      = "../../aws/networking/vpc"
  count       = local.create_virtual_network
  cidr_block  = "172.16.0.0/16"
  environment = var.aws_authentication["environment"]
  project     = var.aws_authentication["project"]
}
