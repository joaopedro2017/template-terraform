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
    instance_names = ["uniademia-develop-db"]
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
    desired_capacity = 4
    min_size         = 2
    max_size         = 5
    location         = "us-east-2"
  }

  ## imagens publicas do ecr 
  ## https://gallery.ecr.aws
  app_runner = {
    create        = false
    service_names = ["runner-1", "runner-2"]
    # image_identifier = "public.ecr.aws/aws-containers/hello-app-runner:latest"
    image_identifier = "public.ecr.aws/datadog/agent:7-rc-servercore-jmx"
    port             = "8000"
  }

  beanstalk_application = {
    create            = false
    application_names = ["beans-1", "beans-2"]
  }

  #Storage
  simple_storage_service = {
    create       = false
    bucket_names = ["storage-bucket-unicademia", "bucket-blue-uniacademia"]
  }

  # Database 
  rds_database = {
    create               = false
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
    create   = false
    db_names = ["athena_academia", "athenadbuniacademia"]
  }

}
