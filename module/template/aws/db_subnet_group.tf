module "db_subnet_group" {
  source            = "../../aws/networking/db_subnet_group"
  count             = var.rds_database["create"] ? 1 : 0
  subnet_group_name = "group-rds-database"
  subnet_id         = [module.subnet_rds_database_a[0].id, module.subnet_rds_database_b[0].id]
}
