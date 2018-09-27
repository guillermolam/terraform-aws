/* Output variables
   * These variables are used organize data to be easily queried and shown back to the Terraform user.
*/

output "route_table_id" {
  value = "${aws_route_table.routetable.id}"
}
