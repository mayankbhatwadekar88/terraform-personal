data "aws_ami" "ubuntu_image" {
  most_recent = true
  owners = [ "amazon" ]

  filter {
    name = "name"
    values = [ "al2023-ami-*" ]
  }
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.ubuntu_image.image_id
  instance_type = "t3.micro"
}
