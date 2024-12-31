# backend.tf
terraform {
  backend "s3" {
    bucket = "terraform-kene-state"
    key    = "s3-static-website/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-kene-state-lock"
    encrypt        = true
  }
}