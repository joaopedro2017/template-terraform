module "elastic_compute_cloud" {
  source                      = "../../aws/compute/elastic_compute_cloud"
  for_each                    = var.elastic_compute_cloud["create"] ? toset(var.elastic_compute_cloud["instance_names"]) : []
  instance_name               = each.key
  ami                         = var.elastic_compute_cloud["ami"]
  instance_type               = var.elastic_compute_cloud["instance_type"]
  username                    = var.elastic_compute_cloud["username"]
  password                    = var.elastic_compute_cloud["password"]
  subnet_id                   = module.subnet_elastic_compute_cloud[0].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.security_group[0].id]
  environment                 = var.aws_authentication["environment"]
  project                     = var.aws_authentication["project"]
}

module "security_group" {
  source = "../../aws/networking/security_group"
  count  = var.elastic_compute_cloud["create"] ? 1 : 0
  vpc_id = module.vpc[0].id
}
