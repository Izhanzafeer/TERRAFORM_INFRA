variable "name" {
  description = "Monitor Alert name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID to monitor"
  type        = string
}

variable "action_group_id" {
  description = "Action Group ID"
  type        = string
}

variable "description" {
  description = "Alert description"
  type        = string
  default     = ""
}

variable "severity" {
  description = "Alert severity"
  type        = number
  default     = 2
}

variable "enabled" {
  description = "Enable alert"
  type        = bool
  default     = true
}

variable "frequency" {
  description = "Evaluation frequency"
  type        = string
  default     = "PT5M"
}

variable "window_size" {
  description = "Evaluation window"
  type        = string
  default     = "PT5M"
}

variable "metric_namespace" {
  description = "Metric namespace"
  type        = string
}

variable "metric_name" {
  description = "Metric name"
  type        = string
}

variable "aggregation" {
  description = "Aggregation type"
  type        = string
  default     = "Average"
}

variable "operator" {
  description = "Comparison operator"
  type        = string
  default     = "GreaterThan"
}

variable "threshold" {
  description = "Alert threshold"
  type        = number
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}