terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region = "us-east-2"
}

variable "splunk" {
  default = "8088"
}
resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  tags = {
    Name        = "payment_app"
    team        = "payments"
    environment = "prod"
  }

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_dev}/32"]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_dev}/32"]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.https2
    to_port     = var.https2
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }
  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "example" {
  domain = "vpc"

  tags = {
    Name        = "payment_app"
    team        = "payments"
    environment = "prod"
  }
}

