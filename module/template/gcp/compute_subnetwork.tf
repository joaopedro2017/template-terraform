module "compute_subnetwork" {
  source      = "../../gcp/networking/compute_subnetwork"
  count       = var.compute_instance["create"] ? 1 : 0
  subnet_name = "${var.gcp_authentication["environment"]}-engine"
  ip_range    = "10.0.0.0/24"
  network_id  = module.compute_network[0].id
}

module "autoscaler_subnetwork" {
  source      = "../../gcp/networking/compute_subnetwork"
  count       = var.compute_autoscaler["create"] ? 1 : 0
  subnet_name = "${var.gcp_authentication["environment"]}-autoscaler"
  ip_range    = "10.0.1.0/24"
  network_id  = module.compute_network[0].id
}
