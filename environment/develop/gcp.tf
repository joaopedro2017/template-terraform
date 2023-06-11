module "gcp" {
  source = "../../module/template/gcp"

  ## Obrigatorio
  gcp_authentication = {
    project     = "terraform-uniacademia"
    environment = "develop"
    region      = "us-central1"
    zone        = "us-central1-a"
  }

  ## Compute
  compute_instance = {
    create         = false
    instance_names = ["instance", "instancioa-nova", "teste", "test"]
    instance_image = "debian-cloud/debian-11"
    machine_type   = "e2-medium"
    zone           = "us-central1-a"
  }

  compute_autoscaler = {
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
    create   = false
    location = "us-central1"
  }

  ## Database
  sql_database = {
    create           = false
    database_names   = ["application", "login", "api"]
    database_version = "MYSQL_8_0"
    tier             = "db-f1-micro"
    region           = "us-central1"
  }

  ## Storage
  storage_bucket = {
    create       = false
    bucket_names = ["bucket-uniacademia", "unicademia_public"]
    location     = "US"
  }
}
