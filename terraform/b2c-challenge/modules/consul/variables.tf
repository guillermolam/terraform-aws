variable "consul_ami_id" {
  description = "consul ami id"
}

variable "consul_instance_type" {
  description = "consul ec2 instance type"
}

variable "aws_region" {
  description = "aws region"
}

variable "key_name" {
  description = "AWS Instance Key Pair"
}

variable "server1_subnet_id" {
  description = "Server 1 Subnet"
}

variable "server2_subnet_id" {
  description = "Server 2 Subnet"
}


variable "server3_subnet_id" {
  description = "Server 3 Subnet"
}

variable "owner" {
  description = "environment owner"
}

variable "environment" {
  description = "environment"
}

variable "consul_instance_profile"{
  description = "Consul Instance profile"
}

variable "security_group_id"{
  description = "security group"
}

variable "server1-az"{
}

variable "server2-az"{
}

variable "server3-az"{
}
