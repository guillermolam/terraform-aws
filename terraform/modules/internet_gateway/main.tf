/*  
  *   This module can be consumed to create a Internet Gateway using terraform .
  *   The variables required should be passed via the variables.tf file
  *   The module outputs the 'id' and the 'arn' of the role created.
*/

resource "aws_internet_gateway" "igw" {
  vpc_id = "${var.vpc_id}"

  tags = "${merge(var.tags, map("Name", format("IGW-%s", var.vpc_name)))}"
}

# Adding route to the Route Table
resource "aws_route" "public_internet_gateway_route" {
  route_table_id         = "${var.route_table_id}"
  destination_cidr_block = "${var.destination_cidr_block}"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}
