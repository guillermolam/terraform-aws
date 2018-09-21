/**************************************************************************************
This File contains the necessary defaults variables to be passed down to the modules.

**************************************************************************************/
access_key = "***************"
secret_key = "***************"
eks_cluster_name = "customer-portal"
eks_certificate_authority =  "*****************************"
eks_endpoint = "**********************"
instance_profile = "arn:aws:iam::179310935215:role/Kubernetes-Role"
security_group_id = "sg-43110709"
subnet_id = "subnet-3998575e"
key_name = "customer-portal-key"

####### Mandatory Tags #######

tags = {
  Owner                  = "Mapfre Digital"
  Environment            = "Staging"
  BusinessUnit           = "IT"
  InfrastrucutreLocation = "US-EAST-1/ North Virginia"
}