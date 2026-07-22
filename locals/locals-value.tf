terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = "us-east-2"
}

locals {
  tags = {
    team = "security-team"
    launch_date = "date-${formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())}"
  }
}

resource "aws_security_group" "sg-01" {
  name = "app-firewall"
  tags = local.tags
}
