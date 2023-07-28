terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "var.access_key"
  secret_key = "var.secret_key"
}
resource "aws_instance" "mytest_terraform" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"
  
  tags = {
    Name = "myterrademo"
  }
  
  count = 3
}
