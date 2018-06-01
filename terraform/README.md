## MAPFRE AWS TERRAFORM SCRIPTS
Terraform scripts for each environments that let you create and manage CLOUD environmnets.

## Environments
'DEV', 'Staging' and 'Prod'.

## Initialisation
Run 'terraform init' to initialise the terraform scripts for the specific environment.

## Module Retrievel
Run 'terraform get' to get the modules into the terraform state for a particular environment.

## View the execution plan
Run 'terraform plan -out out.terraform -var-file master-variables.tf' to view the plan created by terraform. This will only output the plan and will not apply the changes on the remote servers 'aws'.

## Run the scripts
Run 'terraform apply out.terraform' after the viewing the execution plan to apply the changes on the remote provider.


