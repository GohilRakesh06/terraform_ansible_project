output "rg_name" {
  value = var.resource_group_name
}

output "vm_public_ips" {
  value = [for ip in azurerm_public_ip.vm-publicip : ip.ip_address]
}



output "vm_names" {
  value = [for ip in azurerm_public_ip.vm-publicip : ip.ip_address]
}
