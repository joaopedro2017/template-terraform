resource "azurerm_storage_account" "account" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "name" {
  value = azurerm_storage_account.account.name
}

output "primary_key" {
  value = azurerm_storage_account.account.primary_access_key
}