module "compute_network" {
  source       = "../../gcp/networking/compute_network"
  count        = var.compute_instance["create"] ? 1 : 0
  network_name = var.environment
}
