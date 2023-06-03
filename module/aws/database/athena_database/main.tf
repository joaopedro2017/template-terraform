resource "aws_athena_database" "athena_db" {
  name   = var.db_name
  bucket = var.bucket_id  
}