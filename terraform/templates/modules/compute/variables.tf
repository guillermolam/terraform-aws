variable "ec2_ami" {
  description = "Enter the Instance AMI :"
}

variable "instance_type_ec2" {
  description = "Enter the Instance Type for the :"
}

variable "ec2_key_name" {
  description = "Enter the Key Name :"
}

variable "security_group_id_ec2" {
  description = "Enter the Security Group Id :"
}

variable "instance_name" {
  description = "Enter the name :"
}

variable "root_vol_size" {
  description = "Enter the volume size :"
}

variable "subnet_id" {
  description = "Enter the subnet id :"
}

variable "availability_zone" {
  description = "Enter the availability zone:"
}

variable "public_ip"{
 description = "Enter if public IP needs to be assigned :"
}

variable "tags" {
  type = "map"
}
