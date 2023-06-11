resource "aws_security_group" "security_group" {  
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
  }

  tags = {
    Name = "allow_tls"
  }
}