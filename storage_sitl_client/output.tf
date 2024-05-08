output "storage_name" {
  value = module.storage_acc.storage_account_name
}

output "storage_key" {
  value = module.storage_acc.storageaccount_resource_properties
  sensitive = true
}