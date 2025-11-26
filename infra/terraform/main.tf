terraform {
  # For backend and aws provider you have to specify enviroment variables:
  # AWS_ACCESS_KEY_ID
  # AWS_SECRET_ACCESS_KEY

  backend "s3" {
    bucket         = var.service_bucket_name
    key            = "terraform/infra.tfstate"
    region         = var.aws_region
  }
  required_providers {
    aws = {
      source       = "hashicorp/aws"
      version      = "~> 5.0"
    }
  }
}

provider "aws" {
  region            = var.aws_region
}
