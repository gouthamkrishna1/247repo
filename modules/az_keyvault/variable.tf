variable "product" {
  type = any
  default = ""
}

variable "location" {
    type =any
    default = ""
}

variable "resource_group_name" {
  type = any
  default = ""
}

variable "tenant_id" {
  type = any
  default = ""
}

variable "object_id" {
  type = any
  default = ""
}




variable "key_vault_config" {
  type = map(object({
    enabled_for_disk_encryption = optional(bool,true)
    purge_protect = optional(bool,false)
    public_access = optional(bool,false)
  }))
}

# variable "enabled_for_disk_encryption" {
#   type = bool
#   default = true
# }

# variable "purge_protect" {
#   type = bool
#   default = false
# }

# variable "public_access" {
#   type = bool
#   default = false
# }

variable "sku" {
  type = string
  default = ""
}

variable "key_perm" {
  type = string
  default = ""
}

variable "secret_perm" {
  type = string
  default = ""
}

variable "storage_perm" {
  type = string
  default = ""
}