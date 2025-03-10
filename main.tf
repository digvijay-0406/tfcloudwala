provider "aws" {
  region = "ap-south-1"
access_key = var.access_key
secret_key = var.secret_key
}
resource "aws_instance" "myec2" {
  ami                    = var.myami
  instance_type          = var.instype
  tags = {
    Name = "MyNewterra"
  }
}
variable "myami" {
type= string
default = "ami-05c179eced2eb9b5b"
}
variable "instype" {
type = string
default = "t2.micro"
}
variable "access_key" {}
variable "secret_key" {}

