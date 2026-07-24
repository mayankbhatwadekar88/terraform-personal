terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "webapp" {
  ami = "ami-078fe7ff43e10cf8c"
  instance_type = "t3.micro"
  count = 2

  tags = {
    Name = "web-app-${count.index}"
  }
}

output "combined" {
  value = zipmap( aws_instance.webapp[*].tags["Name"],aws_instance.webapp[*].private_ip)
}


