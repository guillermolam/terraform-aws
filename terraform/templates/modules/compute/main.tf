## File to create an aws_instance
resource "aws_instance" "ec2_instance" {
  ami                         = "${var.ec2_ami}"
  availability_zone           = "${var.availability_zone}"
  instance_type               = "${var.instance_type_ec2}"
  key_name                    = "${var.ec2_key_name}"
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = "${var.public_ip}"
  security_groups             = ["${var.security_group_id_ec2}"]

  root_block_device {
    volume_size           = "${var.root_vol_size}"
    delete_on_termination = "true"
  }

  # metadata tagging
  tags = "${merge(var.tags, map("Name", format(var.instance_name)))}"
}
