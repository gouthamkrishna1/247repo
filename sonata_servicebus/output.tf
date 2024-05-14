output "servicebus_keys" {
  value = module.servicebus.resource_name
}

output "servicebus_key_id" {
  value = module.servicebus.id_servicebus
}