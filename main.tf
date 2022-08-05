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

module ubuntu2 {
    source              = "./Module"

    # resource group
    location            = "West Europe"

    # vm
    virtual_machine_name = "ubuntu2"
    admin_username = "anka"
} # endmodule "ubuntu2"