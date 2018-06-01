/*  Input Variables
    * These variables serve as parameters for a Terraform module.
*/

variable "rolename" {
  description = "The name for the role to be created."
}
variable "description" {
  description = "The description of the role to be created."
}
variable "type" {
  description = "The type of principal. eg: For AWS accounts this is 'AWS'."
}
variable "principals" {
  description = "List of identifiers for principals. eg: When type is 'AWS', these are IAM user or role ARNs"
}
