output "iam_instance_profile" {
  value = "${aws_iam_instance_profile.node.name}"
}

output "iam_node_arn" {
  value = "${aws_iam_role.node.arn}"
}
