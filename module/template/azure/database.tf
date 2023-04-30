module "mssql_database" {
  source        = "../../azure/database/mssql_database"
  for_each      = var.mssql_database["create"] ? toset(var.mssql_database["database_names"]) : []
  database_name = each.key

  server_id   = module.mssql_server[0].id
  max_size_gb = var.mssql_database["max_size_gb"]
  sku_name    = var.mssql_database["family_type"]
  collation   = var.mssql_database["collation"]
}
