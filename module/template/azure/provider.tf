provider "azurerm" {
  features {}
  skip_provider_registration = true
  client_id                  = var.az_authentication["client_id"]
  client_secret              = var.az_authentication["client_secret"]
  tenant_id                  = var.az_authentication["tenant_id"]
  subscription_id            = var.az_authentication["subscription_id"]
}
