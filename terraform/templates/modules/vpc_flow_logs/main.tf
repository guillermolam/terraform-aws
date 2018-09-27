###################
# VPC Flow Logs
###################

resource "aws_flow_log" "vpc_flowlog" {
  log_group_name = "${var.log_group_name}"
  iam_role_arn   = "${var.flowlog_role_arn}"
  vpc_id         = "${var.vpc_id}"
  traffic_type   = "${var.traffic_type}"
}
