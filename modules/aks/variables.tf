variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_D4s_v5"
}

variable "os_disk_size_gb" {
  type    = number
  default = 128
}

variable "sku_tier" {
  type    = string
  default = "Free"
}

variable "tags" {
  type = map(string)
}