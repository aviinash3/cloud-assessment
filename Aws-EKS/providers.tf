terraform {
  backend "s3" {}
}
terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.29.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}