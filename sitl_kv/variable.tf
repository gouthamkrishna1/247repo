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
# variable "subs_id" {
#   type = any
#   default = ""
# }

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
 # Private endpint config
variable "private_endpoint_config" {
    description = "configration of the storage account"
    type = any
    default = [ "" ]
}

variable "resource_key" {
  type = map(any)
  default = {
    
  }
}

variable "is_manual_connection" {
  type = bool
  default = false
}

#the subnet under which the private endpoint should be
variable "subnet_id" {
  type = any
  default = ""
}

#DNS A Record
variable "dns_a_record_config" {
  type = any
  default = ""
}

variable "ttl" {
  type = number
  default = 300
}

variable "private_dns_rg" {
  type = any
  default = ""
}

variable "link_name" {
  type = string
  default = ""
}

variable "private_dns_zone" {
  type = any
  default = ""
}


variable "registration_enabled" {
    type = bool
    default = false
  
}
variable "vnet_id" {
  type = any
  default = ""
}