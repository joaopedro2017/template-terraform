resource "azurerm_windows_web_app" "app" {
  name                = "${var.prefix}-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {

    always_on         = "true"
    use_32_bit_worker = "false"
    health_check_path = "/KeepAlive"
  }
}
