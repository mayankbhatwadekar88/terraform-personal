provider "aws" {
  region = "us-east-2"
}

#resource "aws_security_group" "demo-sg28" {
#  name = "demo-sg-28"
#}

removed {
  from = aws_security_group.demo-sg28
  lifecycle {
    destroy = false
  }
}
