/* Output variables
   * These variables are used organize data to be easily queried and shown back to the Terraform user.
*/

output "routetable_subnet_association_ids" {
  value = ["${aws_route_table_association.routetableassociation.*.id}"]
}
