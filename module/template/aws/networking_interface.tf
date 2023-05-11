module "nic_ec2" {
  source      = "../../aws/networking/network_interface"
  subnet_id   = module.subnet_ec2.id
  private_ips = ["172.16.10.100"]
  project     = var.project
  environment = var.environment
}