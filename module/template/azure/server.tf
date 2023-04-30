module "mssql_server" {
  source              = "../../azure/database/mssql_server"
  count               = var.mssql_database["create"] ? 1 : 0
  prefix              = "${var.company}-${var.environment}"
  resource_group_name = module.resource_group[0].name
  location            = var.location
  admin_login         = var.mssql_database["admin_login"]
  admin_password      = var.mssql_database["admin_password"]
}
