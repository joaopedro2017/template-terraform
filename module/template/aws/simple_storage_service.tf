module "simple_storage_service" {
  source      = "../../aws/storage/simple_storage_service"
  for_each    = var.simple_storage_service["create"] ? toset(var.simple_storage_service["bucket_names"]) : []
  bucket_name = each.key
  environment = var.aws_authentication["environment"]
  project     = var.aws_authentication["project"]
}

module "simple_storage_service_athena" {
  source      = "../../aws/storage/simple_storage_service"
  count       = var.athena_database["create"] ? 1 : 0
  bucket_name = "${var.aws_authentication["project"]}-${var.aws_authentication["environment"]}-athena-s3"
  environment = var.aws_authentication["environment"]
  project     = var.aws_authentication["project"]
}
