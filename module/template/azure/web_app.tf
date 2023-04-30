module "windows_web_app" {
  source              = "../../azure/web/windows_web_app"
  for_each            = var.windows_web_app["create"] ? toset(var.windows_web_app["app_names"]) : []
  resource_group_name = module.resource_group[0].name
  prefix              = each.key

  location        = var.location
  service_plan_id = module.service_plan_windows[0].id
}

module "linux_web_app" {
  source              = "../../azure/web/linux_web_app"
  for_each            = var.linux_web_app["create"] ? toset(var.linux_web_app["app_names"]) : []
  resource_group_name = module.resource_group[0].name
  prefix              = each.key

  location        = var.location
  service_plan_id = module.service_plan_linux[0].id
}
