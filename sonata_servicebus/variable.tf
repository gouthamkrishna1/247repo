variable "location" {
  type = string
  default = ""
}

# variable "resource_group_name" {
#   type = string
#   default = ""
# }

variable "sku" {
  type = string
  default = ""
}

variable "product" {
  type = string
  default = ""
}

variable "role" {
  type = string
  default = ""
}

variable "pid" {
  type = any
  default = ""
}

variable "servicebusname_config" {
  type = map(object({
    sku = optional(string, "Premium")
    trusted_services_allowed = optional(bool,true)
    servicebus_public_network_access_enabled = optional(bool, false)
  }))
}

variable "servicebustopic_config" {
  type = map(object({
    rddt = optional(bool, true)
  }))
}

variable "servicebussubs_config" {
  type = map(object({
    dlf = optional(bool, false)
  }))
}

variable "servicebus_role_config" {
  description = "Configuration map for Role Assignments"
  type = map(object({
  }))
}


variable "servicebus_public_network_access_enabled" {
  type = any
  default = ""
}

#private endpoint
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

# variable "resource_principal_id" {
#   type = any
#   default = ""
# }
 
# variable "scope" {
#   type = string
#   default = ""
# }
 
# variable "role_definition_name" {
#   type = string
#   default = ""
# }
