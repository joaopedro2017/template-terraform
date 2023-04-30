module "mssql_server" {
  source              = "../../azure/database/mssql_server"
  count               = var.mssql_database["create"] ? 1 : 0
  prefix              = "${var.company}-${var.environment}"
  resource_group_name = module.resource_group[0].name
  location            = var.location
  admin_login         = var.mssql_database["admin_login"]
  admin_password      = var.mssql_database["admin_password"]
}

module "mariadb_server" {
  source              = "../../azure/database/mariadb_server"
  count               = var.mariadb_database["create"] ? 1 : 0
  prefix              = "${var.company}-${var.environment}"
  location            = var.location
  resource_group_name = module.resource_group[0].name

  sku_name       = var.mariadb_database["family_type"]
  storage_mb     = var.mariadb_database["storage_mb"]
  admin_login    = var.mariadb_database["admin_login"]
  admin_password = var.mariadb_database["admin_password"]
}
