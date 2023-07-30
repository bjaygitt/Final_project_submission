provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials]
  profile = "default"
}
resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  count = 3
  tags = {
    Name = "${var.env}-${count.index}"
  }
  }

