resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true

  tags = {
    Name        = var.db_name
    Environment = var.environment
    Project     = var.project
  }
}