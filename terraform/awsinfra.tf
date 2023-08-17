provider "aws" {
 region     = "ca-central-1"
 shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
 profile = "default"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  count = 1

  tags = {
    env  = var.env
    Name = "${var.env}-${count.index}"
  }
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type_1 = var.instance_type_1

  count = 1

  tags = {
    env_1  = var.env_1
    Name = "${var.env_1}-${count.index}"
  }
}
