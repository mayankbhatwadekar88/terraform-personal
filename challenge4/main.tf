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

data "aws_caller_identity" "current" {}

data "aws_iam_users" "users" {
  
}

resource "aws_iam_user" "demo_user" {
  name = "admin-user-${data.aws_caller_identity.current.account_id}"
}

output "list-users" {
  value = tolist([data.aws_iam_users.users.names])
}

output "total_users" {
  value = length(data.aws_iam_users.users.names)
}
