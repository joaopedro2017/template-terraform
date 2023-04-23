module "azure" {
  source      = "../../module/template/azure"
  company     = "uniacademia"
  environment = "develop"
  location    = "eastus2"

    ## Maquina Virtual
  virtual_machine_windows = {
    create        = true
    vm_names      = ["virtual-machine-1", "virtual-machine-2"]
    family_type   = "Standard_B1s"
    publisher     = "MicrosoftWindowsServer"
    image_name    = "WindowsServer"
    image_version = "2016-Datacenter"
    username      = "adminuser"
    password      = "Password1234!"
  }


}