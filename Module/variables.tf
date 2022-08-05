### General Variables
variable "location" {
  description = "The data centerlocation."
}

### Virtual Machine Variables
variable "virtual_machine_name" {
  description = "The name of the virtual machine."
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  default     = "Standard_A2_v2" ## Standard_A2_v2, Standard_A1_v2, Standard_A4_v2
}

variable "admin_username" {
  description = "The username of the administrator of virtual machine."
}