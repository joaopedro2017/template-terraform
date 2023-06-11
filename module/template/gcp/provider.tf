provider "google" {
  project = var.gcp_authentication["project"]
  region  = var.gcp_authentication["region"]
  zone    = var.gcp_authentication["zone"]
}
