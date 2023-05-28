module "simple_storage_service" {
  source      = "../../aws/storage/simple_storage_service"
  for_each    = var.simple_storage_service["create"] ? toset(var.simple_storage_service["bucket_names"]) : []
  bucket_name = each.key
  environment = var.environment
  project     = var.project
}
