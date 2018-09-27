data "terraform_remote_state" "id" {
  backend = "s3"

  config {
    bucket = "musa-terraform"
    key    = "ppr"
    region = "us-east-1"
  }
}
