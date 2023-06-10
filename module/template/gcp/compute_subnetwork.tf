module "compute_subnetwork" {
  source      = "../../gcp/networking/compute_subnetwork"
  count       = var.compute_instance["create"] ? 1 : 0
  subnet_name = var.environment
  ip_range    = "10.0.0.0/24"
  network_id  = module.compute_network[0].id
}
