variable "private_config" {
  type = map(object({
    name = any
  }))
}

variable "resource_group_name" {
  type = string
  default = ""
}