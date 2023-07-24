provider "aws" {
  region     = "us-west-2"
  access_key = "AKIARZU6ZWYIQMO3OZ44"
  secret_key = "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"
}

resource "aws_instance" "mytest_terraform" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t3.micro"

  tags = {
    Name = "myterrademo"
  }
  count = 3
}
~

