# Log Group Name
variable "cloudwatch_log_group_name" {
  default     = ""
  description = "log group name"
}

# Retention Days
variable "retentiondays" {
  default     = ""
  description = "log group retention days"
}
