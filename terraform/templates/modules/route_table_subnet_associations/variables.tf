/*  Input Variables
    * These variables serve as parameters for a Terraform module.
*/

variable "subnet_ids" {
  type= "list"
  description = "Enter the list of subnets that need to be associated with the route table."
}
variable "route_table_id" {
  description = "Enter the list of subnets that need to be associated with the route table."
}
variable "subnetcount" {
  description = "Enter the number of subnets that needs to be associated with the route table."
}
