resource "google_sql_database_instance" "instance" {
  name                = var.instance_name
  region              = var.location
  database_version    = var.database_version
  deletion_protection = "false"

  settings {
    tier = var.tier
  }
}
