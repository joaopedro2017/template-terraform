module "athena_db" {
  source      = "../../aws/database/athena_database"
  for_each    = var.athena_database["create"] ? toset(var.athena_database["db_names"]) : []
  db_name     = each.key
  bucket_id   = module.simple_storage_service_athena[0].id
}
