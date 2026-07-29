terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}

resource "aws_security_group" "prod" {
  name = "prod-sg"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.prod.id
  cidr_ipv4         = "${data.terraform_remote_state.eip.outputs.eip}/32"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}
