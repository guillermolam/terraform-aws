locals {
  consul-server1-userdata = <<USERDATA
#!/bin/bash -xe

sudo service docker start
sudo mkdir -p consul/data
sudo echo "10.169.39.105 mdv-docdevl01" >> /etc/hosts
aws s3 cp s3://mapfre-terraform/certs/mdv-docdevl01.crt .
sudo cp mdv-docdevl01.crt /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust
sudo docker version

docker run -d \
    --net=host \
    --hostname consul-server-1 \
    --name consul-server-1 \
    --env "SERVICE_IGNORE=true" \
    --env "CONSUL_CLIENT_INTERFACE=eth0" \
    --env "CONSUL_BIND_INTERFACE=eth0" \
    --publish 8500:8500 \
    10.169.39.105:18444/consul:1.2.3 \
    consul agent -server -ui -client=0.0.0.0 \
      -bootstrap-expect=3 \
      -advertise='{{ GetInterfaceIP "eth0" }}' \
      -data-dir="/consul/data"
sleep 5
docker logs consul-server-1
docker exec -i consul-server-1 consul members

sudo echo "Successfully completed running the script"
USERDATA
}

# server-1
resource "aws_instance" "consul_server_1" {
  ami                     = "${var.consul_ami_id}"
  instance_type           = "${var.consul_instance_type}"
  availability_zone       = "${var.server1-az}"
  count                   = "1"
  iam_instance_profile    = "${var.consul_instance_profile}"
  key_name                = "${var.key_name}"
  vpc_security_group_ids  = ["${var.security_group_id}"]
  subnet_id               = "${var.server1_subnet_id}"
  user_data_base64 		    = "${base64encode(local.consul-server1-userdata)}"

  tags {
    Owner       = "${var.owner}"
    Terraform   = true
    Environment = "${var.environment}"
    Name        = "tf-instance-consul-server-1"
  }
}
