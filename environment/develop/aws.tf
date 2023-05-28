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
    instance_names = ["uniademia-teste-vm", "uniademia-develop-app"]
    ami            = "ami-0a695f0d95cefc163"
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
}
