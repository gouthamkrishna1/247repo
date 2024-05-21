output "private_end_point_function_storage_output" {
  value = module.functionapp_storage_private_endpoint.private_end_point_IP_address
}

output "function_app_ids" {
  value = module.function_app.func_id
}

output "storage_account_key" {
  value= module.func_app_storage.storageaccount_resource_properties
  sensitive = true
}