##### Account Level Variables
variable "access_key" {
  description = "AWS ACCESS_KEY"
}

variable "secret_key" {
  description = "AWS SECRET_KEY"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

##### Kubernetes Variables
variable "eks_cluster_name" {
  description = "cluster name"
}

variable "eks_certificate_authority"{
}
variable "eks_endpoint" {

}

variable "security_group_id"{

}

variable "subnet_id"{

}

variable "key_name"{

}


##### Consul Variables
variable "consul_ami_id" {
  description = "consul ami id"
}

variable "consul_instance_type" {
  description = "consul ec2 instance type"
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


variable "server1-az"{
}

variable "server2-az"{
}

variable "server3-az"{
}


