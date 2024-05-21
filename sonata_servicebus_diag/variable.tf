# variable "target_resource_id" {
#   type = string
#   default = ""
# }

variable "diagnostic_config" {
  type = any
  default = ""
}

variable "log_id" {
  type = string
  default = ""
}

variable "dest_type" {
  type = string
  default = ""
}

variable "category_group" {
  type = string
  default = ""
}

variable "metrics" {
 type = string
 default = ""
}

variable "product" {
  type = string
  default = ""
}

variable "location" {
  type = string
  default = ""
}

variable "categories" {
  type = list(string)
  default = [""]
}