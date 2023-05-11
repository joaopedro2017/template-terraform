resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name        = "${var.project}-${var.environment}-vpc"
    Environment = var.environment
  }
}

output "id" {
    value = aws_vpc.vpc.id
}