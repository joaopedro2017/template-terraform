provider "google" {
  project = var.provider_project
  region  = var.location
  zone    = "us-central1-a"
}