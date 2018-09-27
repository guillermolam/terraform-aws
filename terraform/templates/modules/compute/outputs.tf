output "nat_instance_id" {
  description = "ID of the NAT instance"
  value       = "${aws_instance.ec2_instance.id}"
}
