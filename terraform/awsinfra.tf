provider "aws" {
 region     = "ca-central-1"
 shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
 profile = "default"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  count = 4

  tags  = {
    Name = "${var.env_1}-${count.index}",\\ "${var.env_2}-${count.index}"
  }
    
