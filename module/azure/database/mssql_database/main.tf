resource "azurerm_mssql_database" "mssql_database" {
  name         = var.database_name
  server_id    = var.server_id
  collation    = var.collation
  license_type = "LicenseIncluded"
  max_size_gb  = var.max_size_gb
  read_scale   = true
  sku_name     = var.sku_name
}