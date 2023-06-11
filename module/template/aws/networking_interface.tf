module "nic_elastic_compute_cloud" {
  source      = "../../aws/networking/network_interface"
  count       = var.elastic_compute_cloud["create"] ? 1 : 0
  subnet_id   = module.subnet_elastic_compute_cloud[0].id
  private_ips = ["172.16.10.100"]
  project     = var.aws_authentication["project"]
  environment = var.aws_authentication["environment"]
}
