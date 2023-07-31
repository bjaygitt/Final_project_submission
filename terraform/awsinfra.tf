
provider "aws" {
  region = "us-east-1"
  shared_credential_files =["~/.aws/credentials"]
  profile = "default"
}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]


resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

  count = 3
  tags  = {
    Name = "${var.env}-${count.index}"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "my_security_group"
  description = "Dynamic block"

    dynamic "ingress"{
    for_each = var.sg_ports
    iterator = port
    content {
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
   }
  }

}


                                                       2,1 
