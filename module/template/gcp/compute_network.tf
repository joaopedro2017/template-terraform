module "compute_network" {
  source       = "../../gcp/networking/compute_network"
  count        = local.create_virtual_network
  network_name = var.environment
}
