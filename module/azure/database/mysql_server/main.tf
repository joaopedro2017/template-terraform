resource "azurerm_mysql_server" "mysql_server" {
  name                = "${var.prefix}-mysqlserver"
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = true
  infrastructure_encryption_enabled = true
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}
