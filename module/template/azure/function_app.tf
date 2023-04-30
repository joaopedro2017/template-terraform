module "windows_function_app" {
  source   = "../../azure/web/windows_function_app"
  for_each = var.windows_function_app["create"] ? toset(var.windows_function_app["function_names"]) : []

  function_name       = each.key
  resource_group_name = module.resource_group[0].name
  location            = var.location

  storage_account_name = module.storage_account_function_wind[0].name
  primary_access_key   = module.storage_account_function_wind[0].primary_key
  service_plan_id      = module.service_plan_windows_function[0].id
}

module "linux_function_app" {
  source   = "../../azure/web/linux_function_app"
  for_each = var.linux_function_app["create"] ? toset(var.linux_function_app["function_names"]) : []

  function_name       = each.key
  resource_group_name = module.resource_group[0].name
  location            = var.location

  storage_account_name = module.storage_account_function[0].name
  primary_access_key   = module.storage_account_function[0].primary_key
  service_plan_id      = module.service_plan_linux_function[0].id
}
