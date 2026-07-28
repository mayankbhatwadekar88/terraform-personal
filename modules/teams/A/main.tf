provider "aws" {
  region = "us-east-2"
}

module "ec2" {
  source        = "../../modules/ec2"
  ami           = "ami-04ea4e8270c27626c"
  instance_type = "t3.micro"
}

resource "aws_eip" "lb" {
  instance = module.ec2.instance_id
  domain   = "vpc"
}
