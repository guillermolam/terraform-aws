#File to create security group
resource "aws_security_group" "SecurityGroup" {
  name        = "${var.name}"
  description = "${var.description}"
  tags        = "${merge(var.tags, map("Name", format(var.name)))}"
  vpc_id      = "${var.vpc_id}"
}
