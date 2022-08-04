terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.16.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}
module test1 {
    source              = "./Module"

    # resource group
    location            = "West Europe"

    # vm
    virtual_machine_name = "test1"
    admin_username = "test1"
} # endmodule "test1"
module test12 {
    source              = "./Module"

    # resource group
    location            = "France Central"

    # vm
    virtual_machine_name = "test12"
    admin_username = "test12"
} # endmodule "test12"