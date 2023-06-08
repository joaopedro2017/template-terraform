output "name" {
  value = azurerm_storage_account.account.name
}

output "primary_key" {
  value = azurerm_storage_account.account.primary_access_key
}
