output "iam_consul_instance_profile" {
  value = "${aws_iam_instance_profile.consulNode.name}"
}

output "iam_consul_node_arn" {
  value = "${aws_iam_role.consulNode.arn}"
}
