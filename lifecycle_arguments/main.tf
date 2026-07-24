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

resource "aws_instance" "name" {
  ami = "ami-0e5497a77ef21b5ac"
  instance_type = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }
}
