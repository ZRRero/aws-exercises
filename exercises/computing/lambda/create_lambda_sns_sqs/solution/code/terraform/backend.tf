terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.13.0"
    }
  }
  backend "s3" {
    encrypt = true
  }
}