output "nat_instance_id" {
  description = "ID of the NAT instance"
  value       = "${aws_instance.nat_instance.id}"
}
