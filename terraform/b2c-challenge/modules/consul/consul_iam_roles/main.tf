resource "aws_iam_role" "consulNode" {
  name = "terraform-consul-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "consulNode-AmazonS3FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = "${aws_iam_role.consulNode.name}"
}

resource "aws_iam_instance_profile" "consulNode" {
  name = "terraform-consul-node"
  role = "${aws_iam_role.consulNode.name}"
}
