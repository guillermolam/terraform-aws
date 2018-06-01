/**************************************************************************************
  This files creates the necessary resources for a dev environment in us-east 1a.
  The following resources are created via this file-
    * 1 VPC.
    * 1 Public Subnet.
    * 1 Internet Gateway.
    * 1 Security Group for http,https and ssh.
    * 1 Route Table and its association to the public subnet.
    * 1 EC2 Instance.
    * A VPC Flow Log 
    * A Cloud Watch Log group (With IAM Role Attached)

******************************************************************************************/
/* Generic Configurable Values */

###########################
#      Provider
##########################
provider "aws" {
  region = "${var.account_region}"
}

###########################
#      VPC
##########################

module "vpc" {
  source               = "../../modules/vpc"
  vpc_name             = "${var.vpc_name}"
  vpc_cidr             = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  tags                 = "${var.tags}"
}

###########################
#      SUBNETS
##########################

#### Public Subnets ####
module "subnet_1" {
  source            = "../../modules/subnet"
  vpc_id            = "${module.vpc.vpc_id}"
  subnet_name       = "${var.account_env}-public-${var.subnet1_az}"
  subnet_cidr       = "${var.subnet1_cidr}"
  availability_zone = "${var.subnet1_az}"
  tags              = "${var.tags}"
}

###########################
#      ROUTE TABLE
##########################

module "routetable" {
  source          = "../../modules/route_table"
  routetable_name = "${var.account_env}-rt-${var.account_region}"
  vpc_id          = "${module.vpc.vpc_id}"
  tags            = "${var.tags}"
}

module "routetableassociation" {
  source         = "../../modules/route_table_subnet_associations"
  subnetcount    = "1"
  subnet_ids     = ["${module.subnet_1.subnet_id}"]
  route_table_id = "${module.routetable.route_table_id}"
}

###########################
#      Internet Gateway
##########################

module "internet_gateway" {
  source         = "../../modules/internet_gateway"
  vpc_id         = "${module.vpc.vpc_id}"
  vpc_name       = "${var.vpc_name}"
  route_table_id = "${module.routetable.route_table_id}"
  tags           = "${var.tags}"
}

###########################
#      Security Groups
##########################
#### Public DMZ
module "public_dmz" {
  source      = "../../modules/security_group"
  vpc_id      = "${module.vpc.vpc_id}"
  name        = "${var.account_env}-public_dmz"
  description = "DMZ for dev instances"
  tags        = "${var.tags}"
}

module "public_servers_sg_rules" {
  source            = "../../modules/security_group_rule"
  tags              = "${var.tags}"
  security_group_id = "${module.public_dmz.sgid}"
  ingress_rules     = "${var.public_ingress_rules}"
  egress_rules      = "${var.public_egress_rules}"
}

###########################
#      Keys
##########################
module "instance_keys" {
  source             = "../../modules/key"
  path_to_public_key = "../../modules/key/mykey.pub"
}

###########################
#    Cloud watch
##########################

module "cloud_watch" {
  source                    = "../../modules/cloud_watch"
  cloudwatch_log_group_name = "${var.cloudwatch_grpname}"
  retentiondays             = "${var.cloudwatch_rentiondays}"
}

###########################
#    VPC Flow Log
##########################

module "awsvpcflowlogrole" {
  source      = "../../modules/iam_role"
  rolename    = "ROLE-${var.account_name}-AWSFLOWRW"
  description = "Role for VPC FLowlogs"
  type        = "Service"
  principals  = "vpc-flow-logs.amazonaws.com"
}

module "awsvpcflowlogpolicy" {
  source         = "../../modules/iam_policy"
  policyname     = "POLICY-${var.account_name}-AWSFLOWRW"
  description    = "Policy for VPC FlowLogs"
  policydocument = "${data.template_file.aws_vpcflowlog_policy.rendered}"
}

data "template_file" "aws_vpcflowlog_policy" {
  template = "${file("policies/policy_vpcflowlog.tpl")}"
}

module "awsvpcflowlogpolicyattachment" {
  source    = "../../modules/iam_policy_attach"
  rolename  = "${module.awsvpcflowlogrole.roleid}"
  policyarn = "${module.awsvpcflowlogpolicy.policyarn}"
}

module "vpc_flow_log" {
  source           = "../../modules/vpc_flow_logs"
  log_group_name   = "${module.cloud_watch.loggroupname}"
  flowlog_role_arn = "${module.awsvpcflowlogrole.rolearn}"
  vpc_id           = "${module.vpc.vpc_id}"
}

##########################
# EC2 Instance
##########################

module "ec2_instance" {
  source                = "../../modules/compute"
  ec2_ami               = "${var.ec2_ami}"
  availability_zone     = "${var.subnet1_az}"
  instance_type_ec2     = "t2.micro"
  ec2_key_name          = "${module.instance_keys.key_name}"
  security_group_id_ec2 = "${module.public_dmz.sgid}"
  public_ip             = true
  subnet_id             = "${module.subnet_1.subnet_id}"
  root_vol_size         = "8"
  instance_name         = "${var.ec2_instance_name}"
  tags                  = "${var.tags}"
}
