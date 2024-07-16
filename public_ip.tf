resource "azurerm_public_ip" "vm-publicip" {
  count= var.instance_count
  name                = "vmpublicip-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

