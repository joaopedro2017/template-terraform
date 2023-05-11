module "ec2" {
  source        = "../../aws/compute/ec2"
  for_each      = var.ec2["create"] ? toset(var.ec2["instance_names"]) : []
  instance_name = each.key
  ami           = var.ec2["ami"]
  instance_type = var.ec2["instance_type"]
  username      = var.ec2["username"]
  password      = var.ec2["password"]
  subnet_id     = module.subnet_ec2.id
  project       = var.project
  environment   = var.environment
}

