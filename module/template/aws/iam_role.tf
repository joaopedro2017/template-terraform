module "iam_beanstalk" {
  source      = "../../aws/management/iam_role"
  count       = var.beanstalk_application["create"] ? 1 : 0
  iam_role    = var.beanstalk_application["create"] ? "beanstalk-service-role" : null
  action      = "sts:AssumeRole"
  service     = "elasticbeanstalk.amazonaws.com"
  project     = var.project
  environment = var.environment
}
