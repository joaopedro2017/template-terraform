provider "aws" {
  region     = var.aws_authentication["region"]
  access_key = var.aws_authentication["access_key"]
  secret_key = var.aws_authentication["secret_key"]
}
