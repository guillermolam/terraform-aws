# Specifying the provider and access details
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}

module "eks_role" {
  source = "../modules/kubernetes/eks_iam_roles"
}
module "eks_node" {
  source                    = "../modules/kubernetes/eks_node"
  eks_cluster_name          = "${var.eks_cluster_name}"
  eks_certificate_authority = "${var.eks_certificate_authority}"
  eks_endpoint              = "${var.eks_endpoint}"
  instance_profile          = "${module.eks_role.iam_instance_profile}"
  security_group_id         = "${var.security_group_id}"
  subnet_id                 = "${var.subnet_id}"
  key_name                  = "${var.key_name}"
}

module "consul_role" {
  source = "../modules/consul/consul_iam_roles"
}

module "consul" {
  source                    = "../modules/consul"
  consul_ami_id             = "${var.consul_ami_id}"
  consul_instance_type      = "${var.consul_instance_type}"
  consul_instance_profile    = "${module.consul_role.iam_consul_instance_profile}"
  aws_region                = "${var.aws_region}"
  key_name                  = "${var.key_name}"
  server1_subnet_id         = "${var.server1_subnet_id}"
  server2_subnet_id         = "${var.server2_subnet_id}"
  server3_subnet_id         = "${var.server3_subnet_id}"
  security_group_id         = "${var.security_group_id}"
  server1-az                = "${var.server1-az}"
  server2-az                = "${var.server2-az}"
  server3-az                = "${var.server3-az}"
  owner                     = "${var.owner}"
  environment               = "${var.environment}"
}
