module "gcp" {
  source = "../../module/template/gcp"

  ## Obrigatorio
  project     = "terraform-uniacademia"
  environment = "develop"
  location    = "us-central1"

  ## Compute
  compute_instance = {
    create         = true
    instance_names = ["instance", "instancioa-nova", "teste", "test"]
    instance_image = "debian-cloud/debian-11"
    machine_type   = "e2-medium"
    zone           = "us-central1-a"
  }
}
