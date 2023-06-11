module "windows_web_app" {
  source              = "../../azure/compute/windows_web_app"
  for_each            = var.windows_web_app["create"] ? toset(var.windows_web_app["app_names"]) : []
  resource_group_name = module.resource_group[0].name
  prefix              = each.key
  location            = var.az_authentication["location"]
  service_plan_id     = module.service_plan_app_windows[0].id
}

module "linux_web_app" {
  source              = "../../azure/compute/linux_web_app"
  for_each            = var.linux_web_app["create"] ? toset(var.linux_web_app["app_names"]) : []
  resource_group_name = module.resource_group[0].name
  prefix              = each.key
  location            = var.az_authentication["location"]
  service_plan_id     = module.service_plan_app_linux[0].id
}
