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

variable "subnet1_az" {
  description = "Provide Availability Zone for Subnet1."
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

variable "aws_key_name" {
  description = "Provide the Key Name :"
  default     = ""
}

variable "cloudwatch_grpname" {
  description = "Enter Cloud Watch Group Name :"
}

variable "cloudwatch_rentiondays" {
  description = "Enter Cloud Watch retention Days :"
}

variable "ec2_ami"{
 description = "Enter the ami name :"
}

variable "ec2_instance_name"{
 description = "Enter instance name :"
}



