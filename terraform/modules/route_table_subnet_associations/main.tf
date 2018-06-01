/*  VPC ROUTE TABLE SUBNET ASSOCIATION
  *   This module can be consumed to associate a route table with subnet using terraform.
  *   This module can be used to associate multiple subnets (Input passed as a list) to a single route table
  *   The variables required should be passed via the variables.tf file.
  *   The module outputs the 'id' of the route table association created.
*/

resource "aws_route_table_association" "routetableassociation" {
  count = "${var.subnetcount}"

  subnet_id      = "${element(var.subnet_ids, count.index)}"
  route_table_id = "${var.route_table_id}"
}
