# resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.virtual_machine_name}"
  location = "${var.location}"
}

# network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.virtual_machine_name}"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${var.virtual_machine_name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefixes      = ["10.0.2.0/24"]
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
}

resource "azurerm_network_interface" "nic" {
  name                      = "nic-${var.virtual_machine_name}"
  location                  = "${azurerm_resource_group.rg.location}"
  resource_group_name       = "${azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "nic-${var.virtual_machine_name}-configuration"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

# virtual machine

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.virtual_machine_name}"
  location              = "${azurerm_resource_group.rg.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]
  vm_size               = "${var.virtual_machine_size}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.virtual_machine_name}-disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.virtual_machine_name}"
    admin_username = "${var.admin_username}"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}