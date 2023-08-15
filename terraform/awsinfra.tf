provider "aws" {
 region     = "ca-central-1"
 shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
 profile = "default"
}

variable "envs" {
  type    = list(string)
  default = "dev"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  count = 2

  dynamic "envs" {
    for_each = var.envs
  tags = {
    envs  = var.envs
    Name = "${var.envs}-${count.index}
  }
}

