variable "name" {
  description = "Action Group name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "short_name" {
  description = "Short name for Action Group"
  type        = string
}

variable "email_receivers" {
  description = "List of email receivers"
  type = list(object({
    name          = string
    email_address = string
  }))
  default = []
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}