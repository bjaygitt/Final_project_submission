provider "aws" {
region     = "ca-central-1"
shared_credentials_files = ["~/.aws/credentials"]
profile = "default"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "Webserver"

  count = 1

  tags = {
    env  = var.env
    Name = "${var.env}-${count.index}"

variable "key_name" {
  description = "Name of the default SSH key pair"
}

resource "aws_key_pair" "default" {
  key_name   = var.key_name
  public_key = file("/home/ubuntu/.ssh/id_rsa.pub") # Replace with the path to your public key
}

  }
}
