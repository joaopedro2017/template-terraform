module "compute_autoscaler" {
  source               = "../../gcp/compute/compute_autoscaler"
  count                = var.compute_autoscaler["create"] ? 1 : 0
  autoscaler_name      = var.compute_autoscaler["autoscaler_name"]
  instance_image       = var.compute_autoscaler["instance_image"]
  machine_type         = var.compute_autoscaler["machine_type"]
  min_replicas         = var.compute_autoscaler["min_replicas"]
  max_replicas         = var.compute_autoscaler["max_replicas"]
  cooldown_period      = var.compute_autoscaler["cooldown_period"]
  zone                 = var.compute_autoscaler["zone"]
  project              = var.gcp_authentication["project"]
  network_self_link    = module.compute_network[0].self_link
  subnetwork_self_link = module.autoscaler_subnetwork[0].self_link
}
