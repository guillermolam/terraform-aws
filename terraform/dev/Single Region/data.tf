data "terraform_remote_state" "id" {
  backend = "s3"

  config {
    bucket = "musa-terraform"
    key    = "data-dev"
    region = "us-east-1"
  }
}
