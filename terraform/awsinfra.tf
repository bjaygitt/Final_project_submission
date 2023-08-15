provider "aws" {
 region     = "ca-central-1"
 shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
 profile = "default"
}

variable "envs" {
  type    = list(string)
  default = ["dev", "qa", "prod"]
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  count = length(var.envs)

  dynamic "tags" {
    for_each = var.envs
    content {
      key   = "Name"
      value = "${tags.value}-instance"
    }
  }

  dynamic "tags" {
    for_each = var.envs
    content {
      key   = "Environment"
      value = tags.value
    }
  }
}

