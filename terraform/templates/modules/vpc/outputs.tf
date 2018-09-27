/* Output variables
   * These variables are used organize data to be easily queried and shown back to the Terraform user.
*/

output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.vpc.id}"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "${aws_vpc.vpc.cidr_block}"
}
