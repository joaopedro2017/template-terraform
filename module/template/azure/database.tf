module "mssql_database" {
  source        = "../../azure/database/mssql_database"
  for_each      = var.mssql_database["create"] ? toset(var.mssql_database["database_names"]) : []
  database_name = each.key

  server_id   = module.mssql_server[0].id
  max_size_gb = var.mssql_database["max_size_gb"]
  sku_name    = var.mssql_database["family_type"]
  collation   = var.mssql_database["collation"]
}

module "mariadb_database" {
  source         = "../../azure/database/mariadb_database"
  for_each       = var.mariadb_database["create"] ? toset(var.mariadb_database["database_names"]) : []
  maria_database = each.key

  resource_group_name = module.resource_group[0].name
  maria_server_name   = module.mariadb_server[0].name
  collation           = var.mariadb_database["collation"]
}

module "mysql_database" {
  source        = "../../azure/database/mysql_database"
  for_each      = var.mysql_database["create"] ? toset(var.mysql_database["database_names"]) : []
  database_name = each.key

  resource_group_name = module.resource_group[0].name
  server_name         = module.mysql_server[0].name
  collation           = var.mysql_database["collation"]
}
