terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

data "aws_ec2_instance_type" "example" {
    instance_type = var.instance_type
}

resource "aws_instance" "myec2" {
  ami = "ami-04ea4e8270c27626c"
  instance_type = var.instance_type
  associate_public_ip_address = false
  lifecycle {
    precondition {
      condition = data.aws_ec2_instance_type.example.free_tier_eligible
      error_message = "Only free tier instance type is allowed"
    }
    postcondition {
      condition = self.public_ip != ""
      error_message = "Ec2 instance must have public IP"
    }
  }
}
