/*  IAM POLICY ATTACHMENT
  *   This module can be consumed to attach a policy to an rule using terraform .
  *   The module can take both 'AWS managed Policy' arn or 'Custom Policy' arn.
  *   The variables required should be passed via the variables.tf file
*/

resource "aws_iam_role_policy_attachment" "policy-attach" {
    role  = "${var.rolename}"
    policy_arn = "${var.policyarn}"
}
