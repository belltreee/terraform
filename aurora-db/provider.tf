terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.10.0"
    }
  }

  #S3
  backend "s3" {
    bucket  = "3s-test"
    key     = "test/aurora.terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "profile-name"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "11.0.0.0/16"
}
