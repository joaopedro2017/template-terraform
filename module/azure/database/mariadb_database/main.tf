resource "azurerm_mariadb_database" "mariadb" {
  name                = var.maria_database
  resource_group_name = var.resource_group_name
  server_name         = var.maria_server_name
  charset             = "utf8mb4"
  collation           = var.collation
}
