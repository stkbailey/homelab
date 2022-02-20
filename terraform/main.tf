terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.72.0"
    }
  }
}

provider "aws" {
  region                  = var.region
  shared_credentials_file = var.shared_credentials_file
  profile                 = var.profile_name
  default_tags {
    tags = {
      Name = "tf-test"
      Environment = "development" 
    }
  }
}

module "aws" {
  source = "./aws"
}
