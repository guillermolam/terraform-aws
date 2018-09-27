variable "nat_ami_id" {
  # ami-14c5486b
  description = "Enter nat ami id"
}

variable "availability_zone" {
  description = "Enter the availability zone to place the NAT :"
}

variable "instance_type" {
  description = "Enter the Instance Type for the NAT :"
}

variable "aws_key_name" {
  description = "Enter the Key Name :"
}

variable "securitygroup_id" {
  description = "Enter the Security Group Id :"
}

variable "subnet_id" {
  description = "Enter the Subnet Id to place the NAT in :"
}

variable "nat_name" {
  description = "Enter the NAT name :"
}

variable "tags" {
  type = "map"
}
