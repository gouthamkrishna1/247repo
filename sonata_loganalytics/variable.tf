variable "location" {
  type        = string
  description = "desired locations for resources"
}

variable "product" {
  type = string  
}

variable "resource_group_name" {
  type = any
  default = ""
  
}

variable "sku" {
  type = any
  default = ""
}

variable "retention" {
  type = any
  default = ""
}