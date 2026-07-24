terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.12.*"]

  }
}


resource "aws_instance" "myec2" {
  for_each      = var.environment
  ami           = data.aws_ami.amazon_linux.image_id
  instance_type = each.value
  tags = {
    Name = var.names[each.key]
    Env  = each.key
  }
}


