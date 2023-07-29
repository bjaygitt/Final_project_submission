

provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  count = 3

  tags = {
    Name = "${var.env}-${count.index}"
  }

}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  count = 3

  tags = {
    Name = "${var.env}-${count.index}"
  }

}

