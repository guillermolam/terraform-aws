/**************************************************************************************
  This files creates the necessary resources for a given environment in us-east 1a.
  The following resources are created via this file-
    * 1 VPC.
    * 3 Private Subnets.
    * 3 Public Subnets.
    * 1 NAT.
    * 1 Internet Gateway.
    * 2 Security Groups - A private and a Public
    * A launch Config.
    * An autoscaling group with min 2 and make 3.
    * An Application Load Balancer.
    * Route Tables.
    * Elastic IP for the NAT.
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
module "public_subnet_1" {
  source            = "../../modules/subnet"
  vpc_id            = "${module.vpc.vpc_id}"
  subnet_name       = "${var.account_env}-PUBLIC-${var.account_region}-a"
  subnet_cidr       = "${var.subnet1_cidr}"
  availability_zone = "${var.subnet1_az}"
  tags              = "${var.tags}"
}

module "public_subnet_2" {
  source            = "../../modules/subnet"
  vpc_id            = "${module.vpc.vpc_id}"
  subnet_name       = "${var.account_env}-PUBLIC-${var.account_region}-b"
  subnet_cidr       = "${var.subnet2_cidr}"
  availability_zone = "${var.subnet2_az}"

  tags = "${var.tags}"
}

module "public_subnet_3" {
  source            = "../../modules/subnet"
  vpc_id            = "${module.vpc.vpc_id}"
  subnet_name       = "${var.account_env}-PUBLIC-${var.account_region}-c"
  subnet_cidr       = "${var.subnet3_cidr}"
  availability_zone = "${var.subnet3_az}"

  tags = "${var.tags}"
}

#### Private Subnets ####

module "private_subnet_1" {
  source            = "../../modules/subnet"
  vpc_id            = "${module.vpc.vpc_id}"
  subnet_name       = "${var.account_env}-PRIVATE-${var.account_region}-a"
  subnet_cidr       = "${var.subnet4_cidr}"
  availability_zone = "${var.subnet1_az}"
  tags              = "${var.tags}"
}

module "private_subnet_2" {
  source            = "../../modules/subnet"
  vpc_id            = "${module.vpc.vpc_id}"
  subnet_name       = "${var.account_env}-PRIVATE-${var.account_region}-b"
  subnet_cidr       = "${var.subnet5_cidr}"
  availability_zone = "${var.subnet2_az}"
  tags              = "${var.tags}"
}

module "private_subnet_3" {
  source            = "../../modules/subnet"
  vpc_id            = "${module.vpc.vpc_id}"
  subnet_name       = "${var.account_env}-PRIVATE-${var.account_region}-c"
  subnet_cidr       = "${var.subnet6_cidr}"
  availability_zone = "${var.subnet3_az}"
  tags              = "${var.tags}"
}

###########################
#      ROUTE TABLE
##########################

module "routetable" {
  source          = "../../modules/route_table"
  routetable_name = "${var.account_env}RT-${var.account_region}"
  vpc_id          = "${module.vpc.vpc_id}"
  tags            = "${var.tags}"
}

module "public_routetableassociation" {
  source         = "../../modules/route_table_subnet_associations"
  subnetcount    = "3"
  subnet_ids     = ["${module.public_subnet_1.subnet_id}", "${module.public_subnet_2.subnet_id}", "${module.public_subnet_3.subnet_id}"]
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
#### Public ####
module "public_dmz" {
  source      = "../../modules/security_group"
  vpc_id      = "${module.vpc.vpc_id}"
  name        = "public_dmz"
  description = "DMZ for instance that are public facing"
  tags        = "${var.tags}"
}

module "public_servers_sg_rules" {
  source            = "../../modules/security_group_rule"
  tags              = "${var.tags}"
  security_group_id = "${module.public_dmz.sgid}"
  ingress_rules     = "${var.public_ingress_rules}"
  egress_rules      = "${var.public_egress_rules}"
}

#### Private ####
module "private_dmz" {
  source      = "../../modules/security_group"
  vpc_id      = "${module.vpc.vpc_id}"
  name        = "private_dmz"
  description = "DMZ for instance that are public facing"
  tags        = "${var.tags}"
}

module "private_servers_sg_rules" {
  source            = "../../modules/security_group_rule"
  tags              = "${var.tags}"
  security_group_id = "${module.private_dmz.sgid}"
  ingress_rules     = "${var.private_ingress_rules}"
  egress_rules      = []
}

###########################
#      Keys
##########################
module "instance_keys" {
  source             = "../../modules/key"
  path_to_public_key = "../../modules/key/mykey.pub"
}

###########################
#      NAT
##########################

module "private_nat" {
  source            = "../../modules/nat"
  tags              = "${var.tags}"
  nat_ami_id        = "${var.nat_ami_id}"
  nat_name          = "${var.nat_name}"
  availability_zone = "${module.public_subnet_1.subnet_az}"
  instance_type     = "${var.instance_type_nat}"
  aws_key_name      = "${module.instance_keys.key_name}"

  #change this to look incoming traffic. Create new DMZ
  securitygroup_id = "${module.public_dmz.sgid}"
  subnet_id        = "${module.public_subnet_1.subnet_id}"
}

###########################
#      EIP
##########################

module "eip_nat" {
  source          = "../../modules/elastic_ips"
  nat_instance_id = "${module.private_nat.nat_instance_id}"
  vpc_attachement = true
}

###########################
#    NAT  ROUTE TABLE
##########################

module "ppr_nat_routetable" {
  source              = "../../modules/nat_route_table"
  nat_routetable_name = "${var.account_env}-NATRT-${var.account_region}"
  vpc_id              = "${module.vpc.vpc_id}"
  nat_instance_id     = "${module.private_nat.nat_instance_id}"
  tags                = "${var.tags}"
}

module "nat_private_routetableassociation" {
  source         = "../../modules/route_table_subnet_associations"
  subnetcount    = "3"
  subnet_ids     = ["${module.private_subnet_1.subnet_id}", "${module.private_subnet_2.subnet_id}", "${module.private_subnet_3.subnet_id}"]
  route_table_id = "${module.ppr_nat_routetable.route_table_id}"
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

###########################
#      AutoScaling group
##########################

module "autoscaler" {
  source                          = "../../modules/autoscaling"
  launchConfig_ami                = "${var.launchConfig_ami}"
  launch_config_instance_type     = "${var.launch_config_instance_type}"
  launch_config_security_group_id = "${module.private_dmz.sgid}"
  launch_config_key_name          = "${module.instance_keys.key_name}"
  auto_scale_availability_zones   = ["${module.public_subnet_1.subnet_id}", "${module.public_subnet_2.subnet_id}", "${module.public_subnet_3.subnet_id}"]

  //auto_scale_lb_name              = "${var.autoscaler_name}"
  auto_scaler_name = "${var.autoscaler_name}"

  #tags             = "${var.tags}"
}

###########################
#    Application Load Balancer
##########################
module "application_load_balancer" {
  source                     = "../../modules/application_load_balancer"
  load_balancer_name         = "${var.lb_name}"
  load_balancer_is_internal  = false
  security_groups            = ["${module.public_dmz.sgid}"]
  subnets                    = ["${module.public_subnet_1.subnet_id}", "${module.public_subnet_2.subnet_id}", "${module.public_subnet_3.subnet_id}"]
  idle_timeout               = "${var.lb_timeout}"
  enable_deletion_protection = false
  enable_http2               = true
  ip_address_type            = "ipv4"

  load_balancer_create_timeout = "${var.create_timeout}"
  load_balancer_delete_timeout = "${var.delete_timeout}"
  load_balancer_update_timeout = "${var.update_timeout}"

  target_group_name       = "${var.webTargetGroupName}"
  vpc_id                  = "${module.vpc.vpc_id}"
  backend_port            = 80
  backend_protocol        = "HTTP"
  target_type             = "instance"
  target_id               = "${module.autoscaler.autoscalingGroup_id}"
  http_tcp_listeners_port = 80

  #https_tcp_listeners_port = 443

  tags = "${var.tags}"
}
