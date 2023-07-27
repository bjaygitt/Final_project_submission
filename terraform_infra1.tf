terraform {
  required_provider {
    aws = {
      source = "hashicorp/aws"
      version = "~> 1.5.4." 
provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "mytest_terraform" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t3.micro"

  tags = {
    Name = "myterrademo"
  }
  count = 3
}

