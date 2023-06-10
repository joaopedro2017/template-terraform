module "gcp" {
  source = "../../module/template/gcp"

  ## Obrigatorio
  project     = "terraform-uniacademia"
  environment = "develop"
  location    = "us-central1"

  ## Compute
  compute_instance = {
    create         = false
    instance_names = ["instance", "instancioa-nova", "teste", "test"]
    instance_image = "debian-cloud/debian-11"
    machine_type   = "e2-medium"
    zone           = "us-central1-a"
  }

  google_compute_autoscaler = {
    create          = false
    autoscaler_name = "application"
    machine_type    = "e2-medium"
    instance_image  = "debian-cloud/debian-11"
    min_replicas    = 2
    max_replicas    = 2
    cooldown_period = 15
    zone            = "us-central1-a"
  }

  app_engine = {
    create = false
  }

}
