/*  Input Variables
    * These variables serve as parameters for a Terraform module.
*/

variable "policyname" {
  description = "Enter a name for the policy to be created."
}
variable "description" {
    description = "Enter a description for the policy to be created."
}
variable "policydocument" {
    description = "Provide the policy document. This is a JSON formatted string."
}
