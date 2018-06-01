# File to create nat instances
resource "aws_instance" "nat_instance" {
  ami                         = "${var.nat_ami_id}"
  availability_zone           = "${var.availability_zone}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.aws_key_name}"
  vpc_security_group_ids      = ["${var.securitygroup_id}"]
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true
  source_dest_check           = false

  tags = "${merge(var.tags, map("Name", format(var.nat_name)))}"
}
