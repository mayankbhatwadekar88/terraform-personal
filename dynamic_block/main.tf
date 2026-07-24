resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


