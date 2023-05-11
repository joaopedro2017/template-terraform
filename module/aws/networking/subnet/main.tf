resource "aws_subnet" "subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block
  availability_zone = "${var.availability_zone}a"

  tags = {
    Name        = "${var.project}-${var.environment}-subnet"
    Environment = var.environment
  }
}

output "id" {
  value = aws_subnet.subnet.id
}
