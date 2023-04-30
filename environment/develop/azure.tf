module "azure" {
  source      = "../../module/template/azure"
  company     = "uniacademia"
  environment = "develop"
  location    = "eastus2"

  ## Maquina Virtual
  virtual_machine_windows = {
    create        = true
    vm_names      = ["vm-windows-1", "vm-windows-2"]
    family_type   = "Standard_B1s"
    publisher     = "MicrosoftWindowsServer"
    image_name    = "WindowsServer"
    image_version = "2016-Datacenter"
    username      = "adminuser"
    password      = "Password1234!"
  }

  virtual_machine_linux = {
    create        = true
    vm_names      = ["vm-linux-1", "vm-linux-2"]
    family_type   = "Standard_B1s"
    publisher     = "Canonical"
    image_name    = "UbuntuServer"
    image_version = "16.04-LTS"
    username      = "adminuser"
    password      = "Password1234!"
  }

  windows_virtual_machine_scale_set = {
    create           = true
    scale_set_name   = "windows-test"
    family_type      = "Standard_B1s"
    number_instances = 4
    publisher        = "MicrosoftWindowsServer"
    image_name       = "WindowsServer"
    image_version    = "2016-Datacenter-Server-Core"
    password         = "P@55w0rd1234!"
    username         = "adminuser"
  }

  linux_virtual_machine_scale_set = {
    create           = true
    scale_set_name   = "application"
    family_type      = "Standard_B1s"
    number_instances = 4
    publisher        = "Canonical"
    image_name       = "UbuntuServer"
    image_version    = "16.04-LTS"
    username         = "adminuser"
    password         = "4-v3ry-53cr37-p455w0rd"
  }

  ## O Web App é um serviço de hospedagem de aplicativos em nuvem da Microsoft Azure que permite que os desenvolvedores implantem, 
  ## gerenciem e dimensionem seus aplicativos da web com facilidade e rapidez.
  windows_web_app = {
    create           = true
    app_names        = ["app-windows"]
    family_plan      = "B1"
    number_instances = 2
  }

  linux_web_app = {
    create           = true
    app_names        = ["app-linux"]
    family_plan      = "B1"
    number_instances = 1
  }

  windows_function_app = {
    create           = true
    function_names   = ["function-windows"]
    storage_name     = "functionstoragewind"
    family_plan      = "B1"
    number_instances = 1
  }

  linux_function_app = {
    create           = true
    function_names   = ["function-linux"]
    storage_name     = "functionstorage"
    family_plan      = "B1"
    number_instances = 1
  }

  ## O SQL Server Azure é um serviço de banco de dados relacional em nuvem oferecido pela Microsoft Azure. 
  ## Ele fornece aos usuários uma plataforma segura e escalável para armazenar, gerenciar e acessar seus dados em qualquer lugar e a qualquer hora.
  mssql_database = {
    create         = true
    database_names = ["banco_login"]
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    family_type    = "S0"
    max_size_gb    = 4
    admin_login    = "4dm1n157r470r"
    admin_password = "4-v3ry-53cr37-p455w0rd"
  }

  mariadb_database = {
    create         = true
    database_names = ["banco_login"]
    collation      = "utf8mb4_unicode_520_ci"
    family_type    = "B_Gen5_2"
    storage_mb     = 51200
    admin_login    = "acctestun"
    admin_password = "H@Sh1CoR3!"
  }

  mysql_database = {
    create         = true
    database_names = ["banco_login"]
    collation      = "utf8_unicode_ci"
    family_type    = "B_Gen5_2"
    storage_mb     = 51200
    admin_login    = "acctestun"
    admin_password = "H@Sh1CoR3!"
  }






}