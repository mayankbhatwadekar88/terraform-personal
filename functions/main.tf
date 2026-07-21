terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "app-dev" {
  ami = lookup(var.amis, var.region)
  instance_type = "t2.micro"
  count = length(var.tags)

  tags = {
    Name = element(var.tags, count.index)
    launch_date= formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}
