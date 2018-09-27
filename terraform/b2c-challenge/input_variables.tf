/**************************************************************************************
This File contains the necessary defaults variables to be passed down to the modules.

**************************************************************************************/
access_key = "****************"
secret_key = "****************"

##Kubernetes
eks_cluster_name = "customer-portal"
eks_certificate_authority =  "*********************************"
eks_endpoint = "******************************"
instance_profile = "arn:aws:iam::179310935215:role/Kubernetes-Role"
security_group_id = "sg-43110709"
subnet_id = "subnet-3998575e"
key_name = "customer-portal-key"

##Consul
consul_ami_id = "ami-0d813bbc4311b1ff8"
consul_instance_type = "t2.micro"
server3_subnet_id = "subnet-0d513ce62d27ce101"
server2_subnet_id = "subnet-06bcd5193ff9fb7f3"
server1_subnet_id = "subnet-3998575e"
owner = "B2C Challenge"
environment = "Production"
ec2_fullAccess_profile = "EC2-FullAccess"
server1-az                = "us-east-1a"
server2-az                = "us-east-1b"
server3-az                = "us-east-1c"

####### Mandatory Tags #######

tags = {
  Owner                  = "Mapfre Digital"
  Environment            = "Staging"
  BusinessUnit           = "IT"
  InfrastrucutreLocation = "US-EAST-1/ North Virginia"
}