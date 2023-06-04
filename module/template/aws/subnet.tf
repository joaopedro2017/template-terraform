module "subnet_elastic_compute_cloud" {
  source            = "../../aws/networking/subnet"
  count             = var.elastic_compute_cloud["create"] ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.10.0/24"
  availability_zone = var.elastic_compute_cloud["location"]
  project           = var.project
  environment       = var.environment
}

module "subnet_autoscaling_group" {
  source            = "../../aws/networking/subnet"
  count             = var.autoscaling_group["create"] ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.11.0/24"
  availability_zone = var.autoscaling_group["location"]
  project           = var.project
  environment       = var.environment
}
