# File to create elastic IP's
resource "aws_eip" "elastic_ip" {
  instance = "${var.nat_instance_id}"
  vpc      = "${var.vpc_attachement}"
}
