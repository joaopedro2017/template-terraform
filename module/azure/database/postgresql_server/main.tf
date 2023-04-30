resource "azurerm_postgresql_server" "postgresql_server" {
  name                = "${var.prefix}-postgresql"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

output "name" {
  value = azurerm_postgresql_server.postgresql_server.name
}
