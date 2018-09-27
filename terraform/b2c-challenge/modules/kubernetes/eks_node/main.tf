data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["eks-worker-*"]
  }
  most_recent = true
}

data "aws_region" "current" {}

locals {
  demo-node-userdata = <<USERDATA
#!/bin/bash -xe

sudo route add -net 10.169.0.0 netmask 255.255.0.0 gw 10.175.0.199
sudo route add -net 0.0.0.0/0 gw 10.175.0.199

sudo echo "10.169.39.105 mdv-docdevl01" >> /etc/hosts
aws s3 cp s3://mapfre-terraform/certs/mdv-docdevl01.crt .
sudo cp mdv-docdevl01.crt /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust
sudo docker version

CA_CERTIFICATE_DIRECTORY=/etc/kubernetes/pki
CA_CERTIFICATE_FILE_PATH=$CA_CERTIFICATE_DIRECTORY/ca.crt
sudo mkdir -p $CA_CERTIFICATE_DIRECTORY
sudo echo "${var.eks_certificate_authority}" | base64 -d >  $CA_CERTIFICATE_FILE_PATH
INTERNAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
sudo sed -i s,MASTER_ENDPOINT,${var.eks_endpoint},g /var/lib/kubelet/kubeconfig
sudo sed -i s,CLUSTER_NAME,${var.eks_cluster_name},g /var/lib/kubelet/kubeconfig
sudo sed -i s,REGION,${data.aws_region.current.name},g /etc/systemd/system/kubelet.service
sudo sed -i s,MAX_PODS,20,g /etc/systemd/system/kubelet.service
sudo sed -i s,MASTER_ENDPOINT,${var.eks_endpoint},g /etc/systemd/system/kubelet.service
sudo sed -i s,INTERNAL_IP,$INTERNAL_IP,g /etc/systemd/system/kubelet.service
DNS_CLUSTER_IP=10.100.0.10
if [[ $INTERNAL_IP == 10.* ]] ; then DNS_CLUSTER_IP=172.20.0.10; fi
sudo sed -i s,DNS_CLUSTER_IP,$DNS_CLUSTER_IP,g /etc/systemd/system/kubelet.service
sudo sed -i s,CERTIFICATE_AUTHORITY_FILE,$CA_CERTIFICATE_FILE_PATH,g /var/lib/kubelet/kubeconfig
sudo sed -i s,CLIENT_CA_FILE,$CA_CERTIFICATE_FILE_PATH,g  /etc/systemd/system/kubelet.service
sudo systemctl daemon-reload
sudo systemctl restart kubelet
sudo echo "Successfully completed running the script"
USERDATA
}

# Launch Configuration for EKS Worker Nodes
resource "aws_launch_configuration" "terra" {
  associate_public_ip_address = false
  iam_instance_profile        = "${var.instance_profile}"
  image_id                    = "ami-048486555686d18a0"
  instance_type               = "t2.medium"
  name_prefix                 = "terraform-eks"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.security_group_id}"]
  user_data_base64 						= "${base64encode(local.demo-node-userdata)}"

  lifecycle {
    create_before_destroy = true
  }
}

# Autoscalling Group for EKS Worker Nodes
resource "aws_autoscaling_group" "terra" {
  desired_capacity     = 2
  launch_configuration = "${aws_launch_configuration.terra.id}"
  max_size             = 3
  min_size             = 2
  name                 = "terraform-eks"
  vpc_zone_identifier  = ["${var.subnet_id}"]

  tag {
    key                 = "Name"
    value               = "terraform-eks"
    propagate_at_launch = true
  }
  tag {
    key                 = "kubernetes.io/cluster/${var.eks_cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
