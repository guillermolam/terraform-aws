#File to upload ssh-key pairs
resource "aws_key_pair" "terraformkeypair" {
  key_name   = "terraformkeypair"
  public_key = "${file("${var.path_to_public_key}")}"
}
