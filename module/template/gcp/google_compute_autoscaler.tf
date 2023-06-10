module "google_compute_autoscaler" {
  source               = "../../gcp/compute/google_compute_autoscaler"
  count                = var.google_compute_autoscaler["create"] ? 1 : 0
  autoscaler_name      = var.google_compute_autoscaler["autoscaler_name"]
  instance_image       = var.google_compute_autoscaler["instance_image"]
  machine_type         = var.google_compute_autoscaler["machine_type"]
  min_replicas         = var.google_compute_autoscaler["min_replicas"]
  max_replicas         = var.google_compute_autoscaler["max_replicas"]
  cooldown_period      = var.google_compute_autoscaler["cooldown_period"]
  zone                 = var.google_compute_autoscaler["zone"]
  project              = var.project
  network_self_link    = module.compute_network[0].self_link
  subnetwork_self_link = module.autoscaler_subnetwork[0].self_link
}
