module "aws" {
  source = "../../module/template/aws"

  # Obrigatorio 
  project     = "uniacademia"
  environment = "develop"

  # Authentication
  location   = "us-east-2"
  access_key = "access_key"
  secret_key = "secret_key"

  # Compute
  elastic_compute_cloud = {
    create         = true
    instance_names = ["uniademia-develop-db"]
    ami            = "ami-05d8140b845a8aa7b"
    instance_type  = "t2.micro"
    location       = "us-east-2"
    username       = "admin"
    password       = "Teste@2023"
  }

  #Storage
  simple_storage_service = {
    create       = true
    bucket_names = ["storage-bucket-unicademia", "bucket-blue-uniacademia"]
  }

  # Database 
  rds_database = {
    create               = true
    db_names             = ["uniacademiamysql", "uniacademiadb"]
    allocated_storage    = 10
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    db_username          = "foo"
    db_password          = "foobarbaz"
    parameter_group_name = "default.mysql5.7"
  }
  
  athena_database = {
    create   = true
    db_names = ["athena_academia", "athenadbuniacademia"]
  }

}
