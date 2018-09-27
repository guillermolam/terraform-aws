/* Output variables
   * These variables are used organize data to be easily queried and shown back to the Terraform user.
   * The NAME given to the output block (eg: roleid) is the name used to reference the output variable
*/

output "roleid" {
 value = "${aws_iam_role.role.id}"
}

output "rolearn" {
 value = "${aws_iam_role.role.arn}"
}
