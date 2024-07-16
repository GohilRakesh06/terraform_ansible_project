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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCreus5i3SyEpq/QXL7Hi1BTx9WQ06cyRxxuYtMjT/Fjm73mnDiwwjQirRhSBOs6BVvPHK2ycY0Li5KEIs7xhdrYTmM15g6nCXkCvnmqPnlDZxYBr0YioKSiD2N8/XJ2HhXbsdmODyz9AbwmYKWah4a1OFqDAXdf2v4Bg9VqrerXyMNsGEh80LikkaSs59a9Aw5w0Vq+Wyy5hNDtcFmVGcsaNgwUlJRVH7c+MMI75cMaouDmBcyzFOtCzBk29y6znnh1125L0eqnOvBQfQFSy3jM3sKM68qIy7heNIlY73jfZGIygSaFCCs+0X6NdK5eub0MP6Ebc0dL2J3i0BJNweyv+zwkyPnZ/TNROcxgAbUlNORvYtE05gia25UKsznegiCvA4C/4oiBTpMipERU73W1buq1kfPcMowsnwA2pTPNpihWupE/Cqz2Moc84yIpaCJ7BMLzUfXnjyV55NNi8wkPY16/MCTzixWwe8r/hYKEupxj4+xbax60iNDg84Wdo8= rakes@DESKTOP-GRBD6N1"

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
