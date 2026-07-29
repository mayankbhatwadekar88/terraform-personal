terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

output "eip" {
  value = aws_eip.lb.public_ip
}
