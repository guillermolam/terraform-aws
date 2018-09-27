/**************************************************************************************
This File contains the necessary variables to be passed down to the modules.

**************************************************************************************/

variable "account_name" {
  description = "Enter the short name of the account."
  default     = ""
}

variable "account_region" {
  description = "Enter the region of the account."
  default     = ""
}

variable "account_env" {
  description = "Enter the short name of the account."
  default     = ""
}

variable "tags" {
  description = "Enter the tags"
  default     = {}
}

variable "vpc_cidr" {
  description = "Provide Cidr range of vpc."
  default     = ""
}

variable "vpc_name" {
  description = "Provide Cidr range of vpc."
  default     = ""
}

variable "subnet1_cidr" {
  description = "Provide Cidr range of Subnet1."
  default     = ""
}

variable "subnet2_cidr" {
  description = "Provide Cidr range of Subnet1."
  default     = ""
}

variable "subnet3_cidr" {
  description = "Provide Cidr range of Subnet1."
  default     = ""
}

variable "subnet4_cidr" {
  description = "Provide Cidr range of Subnet1."
  default     = ""
}

variable "subnet5_cidr" {
  description = "Provide Cidr range of Subnet1."
  default     = ""
}

variable "subnet6_cidr" {
  description = "Provide Cidr range of Subnet1."
  default     = ""
}

variable "subnet1_az" {
  description = "Provide Availability Zone for Subnet1."
  default     = ""
}

variable "subnet2_az" {
  description = "Provide Availability Zone for Subnet2."
  default     = ""
}

variable "subnet3_az" {
  description = "Provide Availability Zone for Subnet3."
  default     = ""
}

variable public_egress_rules {
  description = "Provide Public egress rules :"
  type        = "list"
  default     = []
}

variable public_ingress_rules {
  description = "Provide Public ingress rules :"
  type        = "list"
  default     = []
}

variable private_egress_rules {
  description = "Provide Private egress rules :"
  type        = "list"
  default     = []
}

variable private_ingress_rules {
  description = "Provide Private ingress rules :"
  type        = "list"
  default     = []
}

variable "nat_ami_id" {
  # ami-14c5486b
  description = "Provide nat ami id"
  type        = ""
}

variable "instance_type_nat" {
  description = "Provide the Instance Type for the NAT :"
  default     = ""
}

variable "aws_key_name" {
  description = "Provide the Key Name :"
  default     = ""
}

variable "nat_name" {
  description = "Provide the NAT name :"
  default     = ""
}

variable "lb_name" {
  description = "Provide the Load balancer name :"
}

variable "lb_timeout" {
  description = "Provide the Load Balancer timeout :"
}

variable "create_timeout" {
  description = "Provide the create timeout for laod balancer :"
}

variable "delete_timeout" {
  description = "Provide the delete timeout for laod balancer :"
}

variable "update_timeout" {
  description = "Provide the update timeout for laod balancer :"
}

variable "webTargetGroupName" {
  description = "Provide the target group name :"
}

variable "launchConfig_ami" {
  description = "Provide the Launch Config AMI :"
}

variable "launch_config_instance_type" {
  description = "Provide the launch config instance type:"
}

variable "autoscaler_name" {
  description = "Provide the autoscaler name:"
}

variable "cloudwatch_grpname" {
  description = "Enter Cloud Watch Group Name :"
}

variable "cloudwatch_rentiondays" {
  description = "Enter Cloud Watch retention Days :"
}
