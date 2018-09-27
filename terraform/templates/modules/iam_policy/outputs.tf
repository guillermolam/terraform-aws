/* Output variables
   * These variables are used organize data to be easily queried and shown back to the Terraform user.
*/

output "policyarn" {
 value = "${aws_iam_policy.role_policies.arn}"
}
