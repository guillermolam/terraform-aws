terraform {
  backend "s3" {
    bucket = "mapfre-terraform"
    key    = "aws-infra-prod"
    region = "us-east-1"
  }
}