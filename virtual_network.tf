resource "azurerm_virtual_network" "myansiblenetwork" {
  name                = var.virtual_network_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5" , "8.8.8.8"]
  depends_on = [ azurerm_resource_group.myrg ]
  
  tags = {
    name = "myansiblenetwork"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "mypublicsubnet1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]
   depends_on = [ azurerm_resource_group.myrg , azurerm_virtual_network.myansiblenetwork]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "myprivatesubnet1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
  depends_on = [ azurerm_resource_group.myrg , azurerm_virtual_network.myansiblenetwork]
  
}