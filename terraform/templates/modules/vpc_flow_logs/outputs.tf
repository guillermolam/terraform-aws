// Output variables

output "vpc_flolog_id" {
  value = "${aws_flow_log.vpc_flowlog.id}"
}
