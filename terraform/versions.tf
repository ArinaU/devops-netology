
terraform {

  backend "s3" {
    bucket = "arinasbucket"
    key    = "~/.aws/config"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
