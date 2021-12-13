resource "azurerm_linux_virtual_machine" "bastion_linuxvm" {
  name = "${local.resource_name_prefix}-${var.bastionvm_hostname}-${local.resource_name_suffix}"
  resource_group_name = azurerm_resource_group.rsg.name
  location = azurerm_resource_group.rsg.location
  size = var.bastionvm_size
  admin_username = var.bastionvm_user
  admin_password = var.bastionvm_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.bastion_vnic.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference { 
    publisher = "Redhat"
    offer     = "RHEL"
    sku       = "7.5"
    version   = "latest"
    }
   custom_data = filebase64("${path.module}/scripts/bootstrap.sh")
    
  }