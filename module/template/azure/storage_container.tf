module "storage_container" {
  source               = "../../azure/storage/storage_container"
  for_each             = var.storage_container["create"] ? toset(var.storage_container["container_names"]) : []
  container_name       = each.key
  storage_account_name = module.storage_account[0].name
}
