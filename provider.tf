terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.20"
    }
  }
}

provider "aws" {
  region                  = "ap-northeast-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}
