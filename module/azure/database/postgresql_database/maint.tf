resource "azurerm_postgresql_database" "postgresql_database" {
  name                = var.postgresql_database
  resource_group_name = var.resource_group_name
  server_name         = var.postgresql_server_name
  charset             = "UTF8"
  collation           = var.collation
}
