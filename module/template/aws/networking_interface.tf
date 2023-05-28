module "nic_elastic_compute_cloud" {
  source      = "../../aws/networking/network_interface"
  subnet_id   = module.subnet_elastic_compute_cloud.id
  private_ips = ["172.16.10.100"]
  project     = var.project
  environment = var.environment
}