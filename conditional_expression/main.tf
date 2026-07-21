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

resource "aws_instance" "my-server" {
   ami           = "ami-078fe7ff43e10cf8c"
   instance_type = var.environmet == "prod" ? "t3.medium":"t3.micro"
}
