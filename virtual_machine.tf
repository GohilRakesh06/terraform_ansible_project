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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUJPfw/X1CAXGAt3P1kwnZvbwkODneGqzZOQwWP6eTU/CCiXt3lKUAxuN8wVv6Da+Gkp1VMffGNbphGAzGv1n96mLIbUUhwTkAb2HSF/CtgZ3Jzq9Om6J2obNIH7NqS56TYoI5tWRs+IQxoZDxDWgL9Y04guUMEQGa+6H+pYgznufIyGlt7CR2ngHcx6K+/h0P/RBCEVufKuHviRkU1g0+8QqCRdzYzKsFewFzq+JXa75FuP7LfkYk8IWbl1eEbQti3ctBn4gqm9o26jOM1cdtz/eGWbv9U0S27tTKvklEq/dLdoMDZwpfN0H1Qu5dIC5+RMzypRnfUgypNdbChsCDv1fHsz86AVlGGTy72bQRHpWiFmw3z+A/nFL+wCbHd65rHpWa6U+Zau/CVzgaa4PZvhH4X5tLYdGcOdpYQ8h4v8+yKR9/1eNmSCWTIAmOFftidH4OmHu1Qzgssgw9BKtNyhtMxsAGQQ3JouifQlkfm0sHl0wI6p/fwZHVcbKXYUk= root@jenkinsos"

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
