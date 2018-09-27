// Vpc Flowlog Variables

# Required variables
variable "traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL"
  default     = "ALL"
}

variable "flowlog_role_arn" {
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group"
}

variable "log_group_name" {
  description = "The Log Group Name"
}

# Optional variables
variable "vpc_id" {
  description = "VPC ID to attach to"
}

variable "retentiondays" {
  default = "90"
}
