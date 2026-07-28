terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

variable "instance_type" {
  type = map(string)
  default = {
    "default"= "t3.medium"
    "dev" = "t3.micro"
    "prod" = "t3.large"
  }
}

resource "aws_instance" "myec2" {
  ami = "ami-078fe7ff43e10cf8c"
  instance_type = var.instance_type[terraform.workspace]
}
