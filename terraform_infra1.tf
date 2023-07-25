provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
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

