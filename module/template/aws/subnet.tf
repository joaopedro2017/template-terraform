module "subnet_elastic_compute_cloud" {
  source            = "../../aws/networking/subnet"
  count             = var.elastic_compute_cloud["create"] ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.10.0/24"
  subnet_name       = "ec2"
  availability_zone = "${var.autoscaling_group["location"]}a"
  project           = var.project
  environment       = var.environment
}

module "subnet_autoscaling_group" {
  source            = "../../aws/networking/subnet"
  count             = var.autoscaling_group["create"] ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.11.0/24"
  subnet_name       = "ag"
  availability_zone = "${var.autoscaling_group["location"]}a"
  project           = var.project
  environment       = var.environment
}

module "subnet_rds_database_a" {
  source            = "../../aws/networking/subnet"
  count             = var.rds_database["create"] ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.12.0/24"
  subnet_name       = "rds-a"
  availability_zone = "${var.rds_database["location"]}b"
  project           = var.project
  environment       = var.environment
}

module "subnet_rds_database_b" {
  source            = "../../aws/networking/subnet"
  count             = var.rds_database["create"] ? 1 : 0
  vpc_id            = module.vpc[0].id
  cidr_block        = "172.16.13.0/24"
  subnet_name       = "rds-b"
  availability_zone = "${var.rds_database["location"]}c"
  project           = var.project
  environment       = var.environment
}
