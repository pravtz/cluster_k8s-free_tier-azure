variable "vm_name" {
  description = "Name of the control plane VM"
  type        = string
}

variable "region" {
  description = "Region where the VM will be deployed"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "size" {
  description = "Size of the control plane VM"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "image_reference" {
  description = "Image reference for the control plane VM"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

variable "ssh_key" {
  description = "Public SSH key for accessing the VM"
  type        = string
}
