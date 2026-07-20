variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "administrator_login" {
  type = string
}

variable "administrator_password" {
  type      = string
  sensitive = true
}

variable "postgres_version" {
  type    = string
  default = "16"
}

variable "sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "delegated_subnet_id" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "zone" {
  type    = string
  default = "1"
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "tags" {
  type = map(string)
}