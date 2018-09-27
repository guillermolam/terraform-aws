# AWS Cloud Watch Resource 
# This module can be consumed to create a cloud watch log group
# Inputs : loggroupname and retention days
# Output : loggroup name and amazon resource name (arn)
resource "aws_cloudwatch_log_group" "cloudwatchloggroup" {
  name              = "${var.cloudwatch_log_group_name}"
  retention_in_days = "${var.retentiondays}"
}
