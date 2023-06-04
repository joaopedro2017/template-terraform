module "elastic_compute_cloud" {
  source                      = "../../aws/compute/elastic_compute_cloud"
  for_each                    = var.elastic_compute_cloud["create"] ? toset(var.elastic_compute_cloud["instance_names"]) : []
  instance_name               = each.key
  ami                         = var.elastic_compute_cloud["ami"]
  instance_type               = var.elastic_compute_cloud["instance_type"]
  username                    = var.elastic_compute_cloud["username"]
  password                    = var.elastic_compute_cloud["password"]
  subnet_id                   = module.subnet_elastic_compute_cloud[0].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg[0].id]
  environment                 = var.environment
  project                     = var.project
}

resource "aws_security_group" "sg" {
  count       = var.elastic_compute_cloud["create"] ? 1 : 0
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc[0].id

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
