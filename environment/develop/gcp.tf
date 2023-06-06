module "gcp" {
  source = "../../module/template/gcp"

  ## Obrigatorio
  project  = "terraform-uniacademia"
  location = "us-central1"

  ## Compute
  compute_instance = {
    create         = true
    instance_names = ["instance"]
    instance_image = "debian-cloud/debian-11"
    machine_type   = "e2-medium"
    location       = "us-central1"
  }
}
