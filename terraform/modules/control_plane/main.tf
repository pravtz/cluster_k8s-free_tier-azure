resource "azurerm_virtual_machine" "control_plane" {
  name                  = var.vm_name
  location              = var.region
  resource_group_name   = var.rg_name
  vm_size               = var.size
  network_interface_ids = [azurerm_network_interface.control_plane_nic.id]

  storage_os_disk {
    name              = "${var.vm_name}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = var.image_reference.publisher
    offer     = var.image_reference.offer
    sku       = var.image_reference.sku
    version   = var.image_reference.version
  }

  os_profile {
    computer_name = var.vm_name
    admin_username = "azureuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = [{
      path     = "/home/azureuser/.ssh/authorized_keys"
      key_data = var.ssh_key
    }]
  }
}
