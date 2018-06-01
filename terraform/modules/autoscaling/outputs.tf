output "launch_config_id" {
  description = "ID of launchConfig"
  value       = "${aws_launch_configuration.launch_Config.id}"
}

output "autoscalingGroup_id" {
  description = "ID of autoScalingGroup"
  value       = "${aws_autoscaling_group.autoscalingGroup.id}"
}
