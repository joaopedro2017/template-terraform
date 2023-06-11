module "beanstalk_application" {
  source           = "../../aws/compute/beanstalk_application"
  for_each         = var.beanstalk_application["create"] ? toset(var.beanstalk_application["application_names"]) : []
  application_name = each.key
  service_role_arn = module.iam_beanstalk[0].arn
  project          = var.aws_authentication["project"]
  environment      = var.aws_authentication["environment"]
}
