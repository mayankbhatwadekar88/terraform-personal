terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

data "aws_iam_users" "users" {}

variable "user-name" {
  default = "demo-user-tfm"
  
  validation {
    condition = length(var.user-name) >= 5
    error_message = "Please enter the name with more than 5 chars"
  }
}

resource "aws_iam_user" "myuser" {
  name = var.user-name
}
