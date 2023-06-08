resource "aws_iam_role" "role" {
  name = var.iam_role

  tags = {
    Name        = var.iam_role
    Environment = var.environment
    Project     = var.project
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "${var.action}"
        Effect = "Allow"
        Principal = {
          Service = "${var.service}"
        }
      },
    ]
  })
}
