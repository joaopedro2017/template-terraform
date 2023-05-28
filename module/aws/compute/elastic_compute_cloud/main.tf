resource "aws_instance" "elastic_compute_cloud" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.vpc_security_group_ids

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
