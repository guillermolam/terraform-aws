/*  Input Variables
    * These variables serve as parameters for a EBS Volume Terraform module.
*/

variable "vpc_name" {
  description = "Enter the name for the VPC to be created."
}

variable "vpc_cidr" {
  description = "Enter the CIDR block for the VPC to be created."
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  default     = false
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  default     = true
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "assign_generated_ipv6_cidr_block" {
  description = "A tenancy option for instances launched into the VPC"
  default     = false
}

variable "tags" {
  type        = "map"
  description = "The list of mandatory tags to be added to the resource"
}
