provider "aws" {
region     = "ca-central-1"
shared_credentials_files = ["~/.aws/credentials"]
profile = "default"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "Key-pair"

  count = 2

  tags = {
    env  = var.env
    Name = "${var.env}-${count.index}"

  }
}
