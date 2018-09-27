/**************************************************************************************
This File contains the necessary defaults variables to be passed down to the modules.
**************************************************************************************/

##Kubernetes
eks_cluster_name = "customer-portal"
eks_certificate_authority =  "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRFNE1EZ3lOekl3TkRVd05sb1hEVEk0TURneU5ESXdORFV3Tmxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBS2U3CnpyNjFqRHVoWmlibGVVWHFDOGVTZXczY25MTEIwalpRbWdmSGdrdngrNFE4all5MWQ0VFppdmhRUUUrUXVHanMKT2NCOEkvV2kxZEVhejBscEdvM2ZERjdDWEdpcWI2R2gyTjdvZ01YaTZ1TGhIMFpDNzlxZ1Yva1VwZzFacFpGZwpjVnM5Smg5Tzh1VXlWcSsxaTVsVDBLTG0rZnF1SGd0clVnWm1xaTBidDkxZEh3VWxiL2RtbVFHRHQ5VnIwR0pxCjNkclA3aGpDbitEQmhwSkpCcVk4MUJyaWdtZ08wZjNSRFRFZmUveEdwV1I2OThwUHNCN1hkaEZmbTRjRUxYdlUKa2RtLzlMUkNiWEh5aWFIZXZ6R2QwdFRGUVRSNElUWllHb2s4V1FtbWZwdWFYK1graGVhN1BSMXFianVLU2JzTgpwbUM3V3hLZEFxUTBYRTJKVDhzQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFBRlg3QmlheFF2WnhzeVRqclEzaG1ldXRnb3oKakNKL1pUTmdwZ1hadkJpM2gzVEh6czl5UW1PV29BdlZGUEg4RHlGN3RleVJTeENheWxXRTdoRVkvU3JtK25YcAp4RzV4ZFpxSm1nWEZxRTRxZ3RwZFdOeS8vUk5rUVpKVjgrUnlUZFJWbXJMbVJDL3UzVVZTU0VmaDZHY0xPbGt2CkdKaE1kK3ZXSUdwMWRXVVRwTHlxTHdFQ01wK3RQbTliUzA1VHNrWDdFYlRja3ZacmxRb2Ztek54VlI3cDlQaWYKVjhNM2ZneFVPZWNJVHRuNHNtZ0hodUUzRng1NDRNczhYNEZoOTZsUTVFN21rYWF6anJLcVdSZWF2RkVzK2E0bApGYXgvNk93MXNMVmtlVjdibllRaGFhUDgyOTRiVDEyYW90aUxHbnEzRWwwcnBNQzFHNjJRczdHUnBEMD0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
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
