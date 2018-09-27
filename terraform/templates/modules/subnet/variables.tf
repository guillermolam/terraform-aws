/*  Input Variables
    * These variables serve as parameters for a EBS Volume Terraform module.
*/

variable "vpc_id" {
  description = "Enter the ID of the VPC where the subnet needs to be created."
}
variable "availability_zone" {
  description = "Enter the AZ of the subnet to be created."
}
variable "subnet_name" {
  description = "Enter the name of the subnet to be created."
}
variable "subnet_cidr" {
  description = "Enter the CIDR block for the subnet"
}
variable "tags" {
  type ="map",
  description = "The list of mandatory tags to be added to the resource"
}
