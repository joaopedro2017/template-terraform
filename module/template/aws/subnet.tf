module "subnet_ec2" {
  source            = "../../aws/networking/subnet"
  vpc_id            = module.vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = var.ec2["location"]
  project           = var.project
  environment       = var.environment
}