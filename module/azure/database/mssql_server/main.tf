resource "azurerm_mssql_server" "mssql" {
  name                         = "${var.prefix}-mssql"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
}

output "id" {
  value = azurerm_mssql_server.mssql.id
}
