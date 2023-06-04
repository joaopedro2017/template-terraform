resource "aws_elastic_beanstalk_application" "beanstalk_application" {
  name        = var.application_name
  description = "Application ${var.application_name}"

  appversion_lifecycle {
    service_role          = var.service_role_arn
    max_count             = 128
    delete_source_from_s3 = true
  }

  tags = {
    Name        = var.application_name
    Environment = var.environment
    Project     = var.project
  }
}
