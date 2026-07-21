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

resource "aws_instance" "myec2" {
  ami = "ami-078fe7ff43e10cf8c"
  instance_type = var.instance_type
  count = 3

  tags = {
    Name = "payments-instance-${count.index}"
  }
}

output "private-ip" {
  value = aws_instance.myec2[0].private_ip
}
output "private-ip1" {
  value = aws_instance.myec2[1].private_ip
}
output "private-ip2" {
  value = aws_instance.myec2[2].private_ip
}
