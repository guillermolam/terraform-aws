/*  VPC ROUTE TABLE
  *   This module can be consumed to create a custom route table using terraform.
  *   The variables required should be passed via the variables.tf file
  *   The module outputs the 'id' of the route table created.
*/

resource "aws_route_table" "routetable" {
  vpc_id = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format(var.routetable_name)))}"
}
