/*  AWS SUBNET
  *   This module can be consumed to create subnet using terraform .
  *   The variables required should be passed via the variables.tf file
  *   The module outputs the 'id' of the subnet created.
*/

resource "aws_subnet" "subnet" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags = "${merge(var.tags, map("Name", format(var.subnet_name)))}"
}
