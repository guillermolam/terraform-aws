terraform {
  backend "s3" {
    bucket = "musa-terraform"
    key    = "dev"
    region = "us-east-1"
  }
}
