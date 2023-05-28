module "elastic_compute_cloud" {
  source               = "../../aws/compute/elastic_compute_cloud"
  for_each             = var.elastic_compute_cloud["create"] ? toset(var.elastic_compute_cloud["instance_names"]) : []
  instance_name        = each.key
  ami                  = var.elastic_compute_cloud["ami"]
  instance_type        = var.elastic_compute_cloud["instance_type"]
  username             = var.elastic_compute_cloud["username"]
  password             = var.elastic_compute_cloud["password"]
  subnet_id            = module.subnet_elastic_compute_cloud.id
  project              = var.project
  environment          = var.environment

  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg.id]
}

resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
  }

  tags = {
    Name = "allow_tls"
  }
}
