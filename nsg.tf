resource "azurerm_network_security_group" "mynsg" {
  name                = var.nsg_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  depends_on = [ azurerm_resource_group.myrg ]

  security_rule {
    name                       = "AllowHttp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "AllowSSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "Production"
  }
}



resource "azurerm_network_interface_security_group_association" "mynsg-sg1" {
  count = var.instance_count
  network_interface_id      = azurerm_network_interface.mynic1[count.index].id
  network_security_group_id = azurerm_network_security_group.mynsg.id
}