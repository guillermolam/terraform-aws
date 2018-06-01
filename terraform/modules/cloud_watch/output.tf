# Log Group resource name
output "loggrouparn" {
  value = "${aws_cloudwatch_log_group.cloudwatchloggroup.arn}"
}

# Log Group Name
output "loggroupname" {
  value = "${var.cloudwatch_log_group_name}"
}
