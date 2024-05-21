variable "location" {
  type = string
  default = ""
}

variable "resource_group_name" {
  type = string
  default = ""
}

variable "sku" {
  type = string
  default = ""
}

variable "product" {
  type = string
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

variable "role" {
  type = string
  default = ""
}

variable "servicebus_role_config" {
  description = "Configuration map for Role Assignments"
  type = map(object({
  }))
}

variable "pid" {
  type = any
  default = ""
}

variable "servicebus_public_network_access_enabled" {
  type = any
  default = ""
}