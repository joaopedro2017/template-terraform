module "subnet_elastic_compute_cloud" {
  source            = "../../aws/networking/subnet"
  vpc_id            = module.vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = var.elastic_compute_cloud["location"]
  project           = var.project
  environment       = var.environment
}