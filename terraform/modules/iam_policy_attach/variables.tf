/*  Input Variables
    * These variables serve as parameters for a Terraform module.
*/

variable rolename {
  description = "Enter the name of the role with which the policy needs to be attached. "
}
variable policyarn {
  description = "Enter the  policy arn that needs to be attached. "
}
