terraform {
  backend "s3" {
    bucket = "terraformbuketall"
    key    = "terraform/backend_exercise1"
    region = "ap-south-1"

  }
}