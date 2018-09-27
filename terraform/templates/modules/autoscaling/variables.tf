variable "launchConfig_ami" {
  description = "Enter the ami id for launch config ami :"
}

variable "launch_config_instance_type" {
  description = "Enter the launch config instance type :"
}

variable "launch_config_security_group_id" {
  description = "Enter the launch Config Security group :"
}

variable "auto_scale_availability_zones" {
  description = "Enter the AutoScale Availability Zones :"
  type        = "list"
}

variable "launch_config_key_name" {
  description = "Enter the name of the key :"
}

#variable "auto_scale_lb_name" {
#  description = "Enter the auto scale load balancer name :"
#}

variable "auto_scaler_name" {
  description = "Enter the auto scaler name :"
}

#variable "tags" {
#  description = "Additional tags for the Default EC2"
#  type        = "map"
#}

