
# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
}


locals {
  web_instance_type_map = {
  stage = "t3.micro"
  prod = "t3.large"
  }
}


locals {
  web_instance_count_map = {
  stage = 1
  prod = 2
  }
}


resource "aws_instance" "count_web" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  count = local.web_instance_count_map[terraform.workspace]
}

locals {
  instances = {
  "t3.micro" = data.aws_ami.amazon_linux.id
  "t3.large" = data.aws_ami.amazon_linux.id
  }
}

resource "aws_instance" "for_each_web" {
  for_each = local.instances
  ami = each.value
  instance_type = each.key

  lifecycle {
    create_before_destroy = true
  }
}


data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
