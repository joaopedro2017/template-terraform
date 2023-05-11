resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  credit_specification {
    cpu_credits = "unlimited"
  }

  user_data = <<-EOF
    #!/bin/bash
    echo '${var.username}:${var.password}' | chpasswd
    EOF

  tags = {
    Name        = var.instance_name
    Environment = var.environment
    Project     = var.project
  }
}