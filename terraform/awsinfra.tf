provider "aws" {
region     = "ca-central-1"
shared_credentials_files = ["~/.aws/credentials"]
profile = "default"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = "Key-pair"

  count = 1

  tags = {
    env  = var.env
    Name = "${var.env}-${count.index}"

  }
}
resource "aws_instance" "prod_servers" {
  count         = 1
  ami           = "ami-0ea18256de20ecdfc" 
  instance_type = "t2.micro"             
  tags = {
    Name = "Prod-Server-${count.index + 1}"
    Environment = "prod"
  }
}

resource "aws_instance" "QA-Server" {
  count         = 1
  ami           = "ami-0ea18256de20ecdfc" 
  instance_type = "t2.micro"             
  tags = {
    Name = "QA-Server-${count.index + 1}"
    Environment = "QA"
  }
}

resource "aws_instance" "Staging_Servers" {
  count         = 1
  ami           = "ami-0ea18256de20ecdfc" 
  instance_type = "t2.micro"             
  tags = {
    Name = "Staging-Server-${count.index + 1}"
    Environment = "Staging"
  }
}

resource "aws_key_pair" "New_TF-key" {
  key_name   = "New_TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "New_TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
