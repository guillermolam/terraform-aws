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

