resource "google_compute_network" "network" {
  name                    = "${var.network_name}-network"
  auto_create_subnetworks = false
}