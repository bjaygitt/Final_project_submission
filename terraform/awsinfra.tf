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
resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
