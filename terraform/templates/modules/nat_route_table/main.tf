/*  VPC ROUTE TABLE
  *   This module can be consumed to create a custom route table using terraform.
  *   The variables required should be passed via the variables.tf file
  *   The module outputs the 'id' of the route table created.
*/

resource "aws_route_table" "nat_routetable" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${var.nat_instance_id}"
  }

  tags = "${merge(var.tags, map("Name", format(var.nat_routetable_name)))}"
}
