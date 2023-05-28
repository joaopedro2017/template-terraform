module "elastic_compute_cloud" {
  source        = "../../aws/compute/elastic_compute_cloud"
  for_each      = var.elastic_compute_cloud["create"] ? toset(var.elastic_compute_cloud["instance_names"]) : []
  instance_name = each.key
  ami           = var.elastic_compute_cloud["ami"]
  instance_type = var.elastic_compute_cloud["instance_type"]
  username      = var.elastic_compute_cloud["username"]
  password      = var.elastic_compute_cloud["password"]
  subnet_id     = module.subnet_elastic_compute_cloud.id
  project       = var.project
  environment   = var.environment
}

