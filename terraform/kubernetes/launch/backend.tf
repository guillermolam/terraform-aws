terraform {
  backend "s3" {
    bucket = "mapfre-terraform"
    key    = "kubernetes"
    region = "us-east-1"
  }
}