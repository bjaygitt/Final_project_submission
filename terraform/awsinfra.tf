provider "aws" {
 region     = "ca-central-1"
 shared_credentials_files = ["/home/jenkins/.aws/credentials"]
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
