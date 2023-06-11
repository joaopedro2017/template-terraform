module "app_runner" {
  source           = "../../aws/compute/app_runner"
  for_each         = var.app_runner["create"] ? toset(var.app_runner["service_names"]) : []
  service_name     = each.key
  image_identifier = var.app_runner["image_identifier"]
  port             = var.app_runner["port"]
  project          = var.aws_authentication["project"]
  environment      = var.aws_authentication["environment"]
}
