terraform {
  backend "s3" {
    bucket = "mk-tf-state-bucket"
    key = "terraform-network-module/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "mk-tf-locks"
    encrypt = true
  }
}