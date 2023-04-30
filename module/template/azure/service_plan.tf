module "service_plan_windows" {
  source              = "../../azure/web/service_plan"
  count               = var.windows_web_app["create"] ? 1 : 0
  resource_group_name = module.resource_group[0].name
  location            = var.location
  os_type             = "Windows"

  prefix       = "${var.company}-${var.environment}-windows"
  sku_name     = var.windows_web_app["family_plan"]
  worker_count = var.windows_web_app["number_instances"]
}
