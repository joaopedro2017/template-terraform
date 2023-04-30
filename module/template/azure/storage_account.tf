module "storage_account_function_windows" {
  source = "../../azure/storage/storage_account"
  count  = var.windows_function_app["create"] ? 1 : 0

  storage_name        = var.windows_function_app["storage_name"]
  resource_group_name = module.resource_group[0].name
  location            = var.location
}

module "storage_account_function_linux" {
  source = "../../azure/storage/storage_account"
  count  = var.linux_function_app["create"] ? 1 : 0

  storage_name        = var.linux_function_app["storage_name"]
  resource_group_name = module.resource_group[0].name
  location            = var.location
}
