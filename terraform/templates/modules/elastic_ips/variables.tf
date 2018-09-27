variable "nat_instance_id" {
  description = "Enter the Instance Id to attach the EIP :"
}

variable "vpc_attachement" {
  description = "Choose whether to attach to VPC :"
  default     = true
}
