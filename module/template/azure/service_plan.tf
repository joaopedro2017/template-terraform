module "service_plan_app_windows" {
  source              = "../../azure/compute/service_plan"
  count               = var.windows_web_app["create"] ? 1 : 0
  resource_group_name = module.resource_group[0].name
  location            = var.az_authentication["location"]
  os_type             = "Windows"
  prefix              = "${var.az_authentication["project"]}-${var.az_authentication["environment"]}-windows"
  sku_name            = var.windows_web_app["family_plan"]
  worker_count        = var.windows_web_app["number_instances"]
}

module "service_plan_app_linux" {
  source              = "../../azure/compute/service_plan"
  count               = var.linux_web_app["create"] ? 1 : 0
  resource_group_name = module.resource_group[0].name
  location            = var.az_authentication["location"]
  os_type             = "Linux"
  prefix              = "${var.az_authentication["project"]}-${var.az_authentication["environment"]}-linux"
  sku_name            = var.linux_web_app["family_plan"]
  worker_count        = var.linux_web_app["number_instances"]
}

module "service_plan_windows_function" {
  source              = "../../azure/compute/service_plan"
  count               = var.windows_function_app["create"] ? 1 : 0
  resource_group_name = module.resource_group[0].name
  location            = var.az_authentication["location"]
  os_type             = "Windows"
  prefix              = "${var.az_authentication["project"]}-${var.az_authentication["environment"]}-windows-function"
  sku_name            = var.windows_function_app["family_plan"]
  worker_count        = var.windows_function_app["number_instances"]
}

module "service_plan_linux_function" {
  source              = "../../azure/compute/service_plan"
  count               = var.linux_function_app["create"] ? 1 : 0
  resource_group_name = module.resource_group[0].name
  location            = var.az_authentication["location"]
  os_type             = "Linux"
  prefix              = "${var.az_authentication["project"]}-${var.az_authentication["environment"]}-linux-function"
  sku_name            = var.linux_function_app["family_plan"]
  worker_count        = var.linux_function_app["number_instances"]
}
