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
    create         = false
    instance_names = ["ec2-2023"]
    ami            = "ami-05d8140b845a8aa7b"
    instance_type  = "t2.micro"
    location       = "us-east-2"
    username       = "admin"
    password       = "Teste@2023"
  }

  autoscaling_group = {
    create           = false
    group_name       = "group-vms"
    ami              = "ami-05d8140b845a8aa7b"
    instance_type    = "t2.micro"
    desired_capacity = 32
    min_size         = 0
    max_size         = 32
    location         = "us-east-2"
  }

  ## imagens publicas do ecr 
  ## https://gallery.ecr.aws
  app_runner = {
    create           = false
    service_names    = ["RUNNER-2023-"]
    image_identifier = "public.ecr.aws/aws-containers/hello-app-runner:latest"
    port             = "8000"
  }

  beanstalk_application = {
    create            = false
    application_names = ["-application-beans-"]
  }

  #Storage
  simple_storage_service = {
    create       = false
    bucket_names = ["storage-bucket-unicademia"]
  }

  # Database 
  rds_database = {
    create               = false
    db_names             = ["rds2023"]
    allocated_storage    = 10
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    db_username          = "foo"
    db_password          = "foobarbaz"
    parameter_group_name = "default.mysql5.7"
    location             = "us-east-2"
  }

  athena_database = {
    create   = false
    db_names = ["athena_ces_"]
  }

}
