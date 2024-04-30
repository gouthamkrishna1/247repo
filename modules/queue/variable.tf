variable "queue_config" {
    type = map(object({
      queue_name = string
    #   storage_account_name = string
    }))
  
}

variable "storage_account_name" {
    type = string
    default = ""
  
}