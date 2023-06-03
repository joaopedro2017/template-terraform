module "rds_database" {
  source               = "../../aws/database/rds_database"
  for_each             = var.rds_database["create"] ? toset(var.rds_database["db_names"]) : []
  db_name              = each.key
  allocated_storage    = var.rds_database["allocated_storage"]
  db_password          = var.rds_database["db_password"]
  db_username          = var.rds_database["db_username"]
  engine               = var.rds_database["engine"]
  engine_version       = var.rds_database["engine_version"]
  parameter_group_name = var.rds_database["parameter_group_name"]
  instance_class       = var.rds_database["instance_class"]
  project              = var.project
  environment          = var.environment
}
