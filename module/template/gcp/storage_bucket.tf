module "storage_bucket" {
  source      = "../../gcp/storage/storage_bucket"
  for_each    = var.storage_bucket["create"] ? toset(var.storage_bucket["bucket_names"]) : []
  bucket_name = each.key
  location    = var.storage_bucket["location"]
}
