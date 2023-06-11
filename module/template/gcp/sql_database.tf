module "sql_database" {
  source        = "../../gcp/database/sql_database"
  for_each      = var.sql_database["create"] ? toset(var.sql_database["database_names"]) : []
  database_name = each.key
  instance_name = module.sql_database_instance[0].name
}

module "sql_database_instance" {
  source           = "../../gcp/database/sql_database_instance"
  count            = var.sql_database["create"] ? 1 : 0
  instance_name    = "${var.gcp_authentication["environment"]}-sql"
  database_version = var.sql_database["database_version"]
  tier             = var.sql_database["tier"]
  region           = var.sql_database["region"]
}
