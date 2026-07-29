terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}

resource "aws_security_group" "prod" {
  name = "prod-sg"
}
