output "key_name" {
  description = "ID of the NAT instance"
  value       = "${aws_key_pair.terraformkeypair.key_name}"
}
