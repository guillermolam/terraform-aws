variable "load_balancer_name" {
  description = "The resource name and Name tag of the load balancer."
}

variable "load_balancer_is_internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  default     = false
}

variable "security_groups" {
  description = "The security groups to attach to the load balancer. e.g. [\"sg-edcd9784\",\"sg-edcd9785\"]"
  type        = "list"
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = "list"
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  default     = 60
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  default     = false
}

variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
  default     = true
}

variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  default     = "ipv4"
}

variable "load_balancer_create_timeout" {
  description = "Timeout value when creating the ALB."
  default     = "10m"
}

variable "load_balancer_delete_timeout" {
  description = "Timeout value when deleting the ALB."
  default     = "10m"
}

variable "load_balancer_update_timeout" {
  description = "Timeout value when updating the ALB "
  default     = "10m"
}

########
variable "target_group_name" {}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed :"
}

variable "backend_port" {
  description = "Enter the backend port for target group :"
}

variable "backend_protocol" {
  description = "Enter the backend protocol for target group :"
}

variable "target_type" {
  description = "Enter the target type for target group :"
}

variable "target_id" {
  description = "Enter the target id for target group :"
}

variable "http_tcp_listeners_port" {
  description = "Enter the http port listener for load balancer :"
}

variable "tags" {
  description = "Additional tags for the Default EC2"
  type        = "map"
}
