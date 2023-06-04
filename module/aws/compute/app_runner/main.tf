resource "aws_apprunner_service" "runner" {
  service_name = var.service_name

  source_configuration {
    image_repository {
      image_configuration {
        port = var.port
      }
      
      image_identifier      = var.image_identifier
      image_repository_type = "ECR_PUBLIC"
    }
    auto_deployments_enabled = false
  }

  tags = {
    Name        = var.service_name
    Environment = var.environment
    Project     = var.project
  }
}
