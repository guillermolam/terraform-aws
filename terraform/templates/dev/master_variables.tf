/**************************************************************************************
This File contains the necessary defaults variables to be passed down to the modules.

**************************************************************************************/

####### account variables #######
account_name = "musa-cloud"

account_env = "dev"

account_region = "us-east-1"

####### VPC Variables #######
vpc_cidr = "10.0.0.0/16"

vpc_name = "musa-dev"

####### Subnet Variables #######

subnet1_az = "us-east-1a"

subnet1_cidr = "10.0.1.0/24"

####### Security Group #######

###Security Group Rules
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
  {
    type        = "ingress"
    from_port   = "22"
    to_port     = "22"
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

# EIP
vpc_attachement = true

#Cloud watch
cloudwatch_grpname = "cloudwatch_log_group"

cloudwatch_rentiondays = 7


####### EC2 ######

ec2_ami = "ami-079efc78"

ec2_instance_name = "b2cAppServer"

####### Mandatory Tags #######

tags = {
  Owner                  = "Mapfre Digital"
  Environment            = "musa-dev"
  BusinessUnit           = "IT"
  InfrastrucutreLocation = "US-EAST-1/ North Virginia"
}
