resource "azurerm_network_interface" "mynic1" {
  count= var.instance_count
  name                = "mynic1-${count.index}"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  depends_on = [ azurerm_resource_group.myrg ]


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm-publicip[count.index].id
  }
}


