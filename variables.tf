variable "client_id" {
  description = "This is the client id used for conencting to azure"
  nullable    = false
  sensitive   = false
  type        = string
  validation {
    condition     = length(var.client_id) >= 16
    error_message = "Please provide a valid guid"
  }


}
variable "client_secret" {
  description = "This is the client secret used for conencting to azure"
  nullable    = false
  sensitive   = true
  type        = string
  validation {
    condition     = length(var.client_secret) >= 16
    error_message = "Please provide a valid secret"
  }


}
variable "tenant_id" {
  default     = "36da45f1-dd2c-4d1f-af13-5abe46b99921"
  description = "This is the tenant id used for conencting to azure"
  nullable    = false
  sensitive   = false
  type        = string
  validation {
    condition     = length(var.tenant_id) >= 16
    error_message = "Please provide a valid guid"
  }


}
variable "subscription_id" {
  default     = "a207cb8b-bad4-49d3-b597-33c89aeb946f"
  description = "This is the subscription used for conencting to azure"
  nullable    = false
  sensitive   = false
  type        = string
  validation {
    condition     = length(var.subscription_id) >= 16
    error_message = "Please provide a valid guid"
  }


}
variable "publisher_email" {
  description = "Publihser email for APIM"
  type        = string
  nullable    = false

}
variable "publisher_name" {
  description = "Publisher name to be displayed"
  type        = string
  nullable    = false

}
variable "azrgname" {
  description = "Resource Group name for AKS cluster"
  type        = string
  nullable    = false
  sensitive   = false

}
variable "azurelocation" {
  description = "Location where azure resource needs to be created"
  type        = string
  nullable    = false
  sensitive   = false

}
/*variable "apiminstances" {
  description = "Names of APIM to be created"
  nullable    = false
  type        = set(string)
  sensitive   = false

}*/
variable "kvname" {
  description = "Key vault names"
  type        = set(string)
  nullable    = false
  sensitive   = false

}
variable "storagekey" {
  description = "storage key"
  type        = string
  nullable    = false
  sensitive   = true

}

variable "varmap" {
  description = "This is map variable example in tf"
  nullable = false
  sensitive = false
  type = map(string)
  
}
variable "varobject" {
  description = "This is terraform object variable"
  nullable = false
  sensitive = false
  type = object({
    name = string
    age = number
    tag = map(string)
  })
}
variable "varlist" {
  type = list(string)
  
}

variable "varset" {
  type = set(string)
  
}
