resource "azurerm_windows_function_app" "function_windows" {
  name                = var.function_name
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.primary_access_key
  service_plan_id            = var.service_plan_id

  site_config {

    always_on         = "true"
    use_32_bit_worker = "false"
    health_check_path = "/KeepAlive"
  }
}