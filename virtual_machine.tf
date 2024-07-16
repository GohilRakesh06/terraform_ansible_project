resource "azurerm_linux_virtual_machine" "machine1" {
  count = var.instance_count
  name                = "vm-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_D2s_v3"
  admin_username      = "rakeshadmin"
  network_interface_ids = [
    azurerm_network_interface.mynic1[count.index].id
  ]

  admin_ssh_key {
    username   = "rakeshadmin"
    public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE2sZrG12FpNCWHj1HxWQA0hmv+fX1OehfyOZOup/lM/ rakes@DESKTOP-GRBD6N1"

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9_3"
    version   = "latest"
  }
  depends_on = [ azurerm_resource_group.myrg , azurerm_virtual_network.myansiblenetwork ]
}
