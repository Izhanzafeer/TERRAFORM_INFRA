variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "network_interface_ids" {
  type = list(string)
}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}

variable "offer" {
  type    = string
  default = "WindowsServer"
}

variable "sku" {
  type    = string
  default = "2022-datacenter-azure-edition"
}

variable "image_version" {
  type    = string
  default = "latest"
}
variable "tags" {
  type    = map(string)
  default = {}
}