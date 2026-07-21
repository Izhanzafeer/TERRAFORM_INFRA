variable "name" {
  type = string
}

variable "display_name" {
  type = string
}

variable "policy_definition_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "parameters" {
  type    = string
  default = null
}