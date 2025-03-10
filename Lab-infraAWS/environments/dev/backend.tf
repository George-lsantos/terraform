terraform {
  backend "s3" {
    bucket = "backend-glsas-terraform-tfstate"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}