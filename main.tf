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

module "vm1" {
    source              = "./Module"

    # resource group
    location            = "West Europe"

    # vm
    virtual_machine_name = "testvm1"
    admin_username = "umit"
}