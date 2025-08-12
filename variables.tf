variable "parameter_name" {
  description = "The name of the SSM parameter"
  type        = string
  default     = "/app/settings/dark-mode"
}

variable "parameter_value" {
  description = "The value of the SSM parameter"
  type        = string
  default     = "false"
}
