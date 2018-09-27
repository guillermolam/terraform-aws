/* Output variables
   * These variables are used organize data to be easily queried and shown back to the Terraform user.
*/

output "subnet_id" {
  description = "Id of the subnet created"
  value       = "${aws_subnet.subnet.id}"
}

output "subnet_az" {
  description = "az of the subnet created"
  value       = "${aws_subnet.subnet.availability_zone}"
}
