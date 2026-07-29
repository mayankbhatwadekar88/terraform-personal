provider "aws" {
  region = "us-east-2"
}

import {
  to = aws_security_group.example
  id = "sg-04cba766d306890f3"
}
