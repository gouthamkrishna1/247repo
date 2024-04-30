
# Define variables
variable "resource_group_name" {
  default = ""
  type =  string
}

variable "location" {
  default = ""
  type = string
}

variable "address_space" {
  type = list(string)
}
 
# variable "subnet_names" {
#   description = "Names of the subnets"
#   type        = list(string)
#   default     = ["db", "web", "app", "paas", "logic-outbound", "func-outbound"]
# }
 
# variable "subnet_cidr" {
#   description = "CIDR blocks for the subnets"
#   type        = list(string)
#   default     = ["10.20.0.0/24","10.20.1.0/24","10.20.2.0/24","10.20.3.0/24","10.20.4.0/24","10.20.5.0/24"]
# }
 


variable "subnet_config" {
    type = map(object({
      address_prefixes = list(string)
      subnet_delegation = optional(bool,false)
      subnet_delegation_iterate = optional(map(object({
        delegate_name = optional(string, null)
        service_delegate = optional(string, null)
        action = optional(string, null)
      })))

    }))
  
}

variable "product" {
    type = string
    default = ""
  
}