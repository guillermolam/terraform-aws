## MAPFRE AWS TERRAFORM SCRIPTS
Terraform scripts for each environments that let you create and manage CLOUD environmnets.
This repo is arranged into two sub folders - b2c-challenge and templates

## Tools
Terraform, AWS Account, AWS CLI (after install of awscli,aws configure needs to be run to configure keys and region),VSCode to run the commands,
and s3 bucket mapfre-terraform in us-east-1 region.

# b2c-challenge
This folder has infrastrucuture specific to b2c-challenge project.Steps to setup -
```
1. git clone <repo_url>
2. cd b2c-challenge/launch
3. terraform init
4. terraform get
5. terraform plan -out "out.terraform" -var "access_key=<access_key>" -var "secret_key=<secret_key>" -var "eks_endpoint=https://DE7FBA3995355F0228B7C020565A6A1F.sk1.us-east-1.eks.amazonaws.com" -var-file=../input_variables.tf
6. terraform apply "out.terraform"
Above steps will create the infrastructure for you.
To delete the infrastructure-
1. terraform destroy -var "access_key=<access_key>" -var "secret_key=<secret_key>" -var "eks_endpoint=https://DE7FBA3995355F0228B7C020565A6A1F.sk1.us-east-1.eks.amazonaws.com" -var-file=../input_variables.tf
```
#templates
This folder has a more generalised layout for creating a complete infrastrucuture for Dev and Staging. Steps to setup-
```
1. git clone <repo_url>
2. cd templates/dev/Single Region
3. terraform init
4. terraform get
5. terarform plan -out "out.terraform" -var "access_key=<access_key>" -var "secret_key=<secret_key>" -var "eks_endpoint=https://DE7FBA3995355F0228B7C020565A6A1F.sk1.us-east-1.eks.amazonaws.com" -var-file=../master_variables.tf
6. terraform apply "out.terraform"
Above steps will create the infrastructure for you.
To delete the infrastructure-
1. terraform destroy -var "access_key=<access_key>" -var "secret_key=<secret_key>" -var "eks_endpoint=https://DE7FBA3995355F0228B7C020565A6A1F.sk1.us-east-1.eks.amazonaws.com" -var-file=../master_variables.tf
```
*** Above same steps apply for creating Staging environment. The only change being cd to template/staging/Single Region


