resource "google_compute_instance_template" "template" {
  provider       = google-beta
  name           = "${var.autoscaler_name}-template"
  machine_type   = var.machine_type
  can_ip_forward = false
  project        = var.project

  disk {
    source_image = var.instance_image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.network_self_link
    subnetwork = var.subnetwork_self_link
  }

  metadata = {
    foo = "bar"
  }
}

resource "google_compute_instance_group_manager" "group_manager" {
  provider = google-beta
  name     = "${var.autoscaler_name}-igm"
  zone     = var.zone
  project  = var.project

  version {
    instance_template = google_compute_instance_template.template.id
    name              = "primary"
  }

  base_instance_name = "autoscaler-sample"
}

resource "google_compute_autoscaler" "autoscaler" {
  provider = google-beta
  name     = var.autoscaler_name
  zone     = var.zone
  project  = var.project
  target   = google_compute_instance_group_manager.group_manager.id

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period
  }
}
