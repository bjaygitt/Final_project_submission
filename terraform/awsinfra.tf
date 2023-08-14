provider "aws" {
 region     = "ca-central-1"
 shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
 profile = "default"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = var.tag_count

  dynamic "tags" {
    for_each = {
      for idx in range(var.tag_count) :
      "${var.env_1}-${idx}" => {
        Name = "${var.env_1}-${idx}"
      }
    }
    content {
      key   = tags.key
      value = tags.value.Name
    }
  }

  dynamic "tags" {
    for_each = {
      for idx in range(var.tag_count) :
      "${var.env_2}-${idx}" => {
        Name = "${var.env_2}-${idx}"
      }
    }
    content {
      key   = tags.key
      value = tags.value.Name
    }
  }
}
