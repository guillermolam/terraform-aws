/**************************************************************************************
This File contains the necessary defaults variables to be passed down to the modules.

**************************************************************************************/

####### account variables #######
account_name = "anjaneyalndatla"

account_env = "ppr"

account_region = "us-east-1"

####### VPC Variables #######
vpc_cidr = "30.0.0.0/16"

vpc_name = "mapfre-ppr"

####### Subnet Variables #######

subnet1_az = "us-east-1a"

subnet2_az = "us-east-1b"

subnet3_az = "us-east-1c"

subnet1_cidr = "30.0.1.0/24"

subnet2_cidr = "30.0.2.0/24"

subnet3_cidr = "30.0.3.0/24"

subnet4_cidr = "30.0.4.0/24"

subnet5_cidr = "30.0.5.0/24"

subnet6_cidr = "30.0.6.0/24"

####### Security Group #######

###Public Rules
public_ingress_rules = [
  {
    type        = "ingress"
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"

    # optional
    ipv6_cidr_blocks = ""
  },
  {
    type        = "ingress"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"

    # optional
    ipv6_cidr_blocks = ""
  },
]

public_egress_rules = [
  {
    type        = "egress"
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"

    #optional
    prefix_list_ids  = ""
    ipv6_cidr_blocks = ""
  },
]

###Private Rules
private_ingress_rules = [
  {
    type        = "ingress"
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"

    # optional
    ipv6_cidr_blocks = ""
  },
  {
    type        = "ingress"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = "10.0.1.0/24,10.0.2.0/24,10.0.3.0/24"

    # optional
    ipv6_cidr_blocks = ""
  },
]

#private_egress_rules = [
#  {
#    type        = "egress"
#    from_port   = "0"
#    to_port     = "0"
#    protocol    = "-1"
#    cidr_blocks = "0.0.0.0/0"

#optional
#    prefix_list_ids  = ""
#    ipv6_cidr_blocks = ""
#  },
#]

# EIP
vpc_attachement = true

#NAT Instance

nat_ami_id = "ami-14c5486b"

availability_zone_nat = "us-east-1a"

instance_type_nat = "t2.medium"

aws_key_name_nat = ""

nat_name = "PPR_NAT"

#Bastion Host

bastion_ami_id = "ami-14c5486b"

bastion_instance_type = "t2.micro"

#Cloud watch
cloudwatch_grpname = "ppr_cloudwatch_log_group"

cloudwatch_rentiondays = 7

# Load Balancer Name
lb_name = "ppr-load-balancer"

lb_timeout = 15

create_timeout = "3m"

delete_timeout = "3m"

update_timeout = "3m"

webTargetGroupName = "pprFrontend"

# Launch Config
launchConfig_ami = "ami-079efc78"

#launch_config_instance_type = "m4.large"
# temporary setting to t2.micro
launch_config_instance_type = "t2.micro"

autoscaler_name = "ppr_auto_scaler"

####### Mandatory Tags #######

tags = {
  Owner                  = "Mapfre Digital"
  Environment            = "Staging"
  BusinessUnit           = "IT"
  InfrastrucutreLocation = "US-EAST-1/ North Virginia"
}
