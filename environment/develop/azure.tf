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


}