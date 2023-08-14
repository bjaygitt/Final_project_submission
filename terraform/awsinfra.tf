provider "aws" {
 region     = "ca-central-1"
 shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
 profile = "default"
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = var.tag_count

  tags = dynamic("tags", {
    for_each = {
      for i in range(var.tag_count) :
      "${var.env_1}-${i}" => {
        Name = "${var.env_1}-${i}"
      },
      for i in range(var.tag_count) :
      "${var.env_2}-${i}" => {
        Name = "${var.env_2}-${i}"
      }
    }
    content {
      key   = tags.key
      value = tags.value
    }
  })
}

