output "vnet_id" {
  value = module.vnet.vnet_resource_key
}

output "subnet_id" {
  value = module.vnet.subnet_resource_key
}