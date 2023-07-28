provider "aws" {
 region = "us-east-1"
 shared_credentials_file = ["~/.aws/credentials"] 
 profile = "default"
}
resource "aws_instance" "mytest_terraform" {
  ami = "ami-03f65b8614a860c29"
  instance_type = "t3.micro"

  tags = {
    Name = "myterrademo"
  }
  count = 3
}

