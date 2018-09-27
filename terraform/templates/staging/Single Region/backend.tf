terraform {
  backend "s3" {
    bucket = "musa-terraform"
    key    = "ppr"
    region = "us-east-1"
  }
}
