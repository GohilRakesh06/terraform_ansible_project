output "rg_name" {
  value = var.resource_group_name
}

output "vm_public_ips" {
  value = azurerm_public_ip.vm-publicip[count.index].ip_address
}



output "vm_names" {
  value = azurerm_linux_virtual_machine.machine1[count.index].name
}
