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
module test7 {
    source              = "./Module"

    # resource group
    location            = "West Europe"

    # vm
    virtual_machine_name = "test7"
    admin_username = "test7"

    virtual_machine_size = "Standard_A4_v2"
} # endmodule "test7"