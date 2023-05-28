module "aws" {
  source      = "../../module/template/aws"

  # Obrigatorio 
  location    = "us-east-2"
  project     = "uniacademia"
  environment = "production"


  ec2 = {
    create         = true
    instance_names = ["instances", "testes"]
    ami            = "ami-0a695f0d95cefc163"
    instance_type  = "t2.micro"
    location       = "us-east-2"
    username       = "admin"
    password       = "Teste@2023"
  }
} 