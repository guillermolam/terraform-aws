/*  Input Variables
    * These variables serve as parameters for a Terraform module.
*/

variable "vpc_id" {
  description = "Enter the Id of the vpc where the route table needs to be created."
}

variable "nat_routetable_name" {
  description = "Enter the name of the route table to be created"
}

variable "nat_instance_id" {
  description = "Enter the NAT instance id :"
}

variable "tags" {
  type        = "map"
  description = "The manadatory tags that needs to be added to the resource."
}
