
provider "aws" {
  region = "us-east-1"
  shared_credential_files = ["~/.aws/credentials"]
   profile = "default"
}
  access_key = "var.access_key"
  secret_key = "var.secret_key"
}
resource "aws_instance" "mytest_terraform" {
  ami = "ami-03f65b8614a860c29"
  instance_type = "t3.micro"

  tags = {
    Name = "myterrademo"
  }
  count = 3
}

