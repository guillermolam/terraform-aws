output "consul_server_1.public_ip" {
  value = "${aws_instance.consul_server_1.private_ip}"
}

/*output "consul_server_2.public_ip" {
  value = "${aws_instance.consul_server_2.private_ip}"
}

output "consul_server_3.public_ip" {
  value = "${aws_instance.consul_server_3.private_ip}"
}*/