/*  IAM ROLE MODULE
  *   This module can be consumed to create a role using terraform .
  *   The variables required should be passed via the variables.tf file
  *   The module outputs the 'id' and the 'arn' of the role created.
*/

resource "aws_iam_role" "role" {
  name               = "${var.rolename}"
  description        = "${var.description}"
  assume_role_policy = "${data.aws_iam_policy_document.role-policy-document.json}"
}

data "aws_iam_policy_document" "role-policy-document" {
  statement {
      actions = ["sts:AssumeRole"]
      principals {
        type        = "${var.type}"
        identifiers = ["${var.principals}"]
      }
      effect = "Allow"
  }
}
