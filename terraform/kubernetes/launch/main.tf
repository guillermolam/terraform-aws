# Specifying the provider and access details
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.aws_region}"
}

module "eks_iam_roles" {
  source = "../eks_iam_roles"
}
module "eks_node" {
  source                    = "../eks_node"
  eks_cluster_name          = "${var.eks_cluster_name}"
  eks_certificate_authority = "${var.eks_certificate_authority}"
  eks_endpoint              = "${var.eks_endpoint}"
  instance_profile          = "${module.eks_iam_roles.iam_instance_profile}"
  security_group_id         = "${var.security_group_id}"
  subnet_id                = "${var.subnet_id}"
  key_name                  = "${var.key_name}"
}


