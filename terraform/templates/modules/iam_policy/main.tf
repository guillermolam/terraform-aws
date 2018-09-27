/*  IAM POLICY MODULE
  *   This module can be consumed to create a policy using terraform .
  *   The variables required should be passed via the variables.tf file
  *   The module outputs the 'arn' of the policy created.
*/

resource "aws_iam_policy" "role_policies" {
    name = "${var.policyname}"
    description = "${var.description}"
    policy = "${var.policydocument}"
}
