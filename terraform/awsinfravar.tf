variable "ami" {

default = "ami-0ea18256de20ecdfc"
}

variable "instance_type" {

default = "t3.micro"

}

variable "env" {

Env:
     - dev
     - prod
}
