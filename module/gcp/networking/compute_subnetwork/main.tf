resource "google_compute_subnetwork" "subnet" {
  name          = "${var.subnet_name}-subnet"
  network       = var.network_id
  ip_cidr_range = var.ip_range
}