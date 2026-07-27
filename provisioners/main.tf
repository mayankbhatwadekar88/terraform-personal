terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2_demo" {
  ami                    = "ami-078fe7ff43e10cf8c"
  instance_type          = "t3.micro"
  key_name               = "linux_ohio"
  vpc_security_group_ids = ["sg-04fa4e3a4b2217e52"]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./linux_ohio.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}
