provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "myec2" {
  ami                    = var.myami
  instance_type          = var.instype
  key_name               = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.mysg.id]
  tags = {
    Name = "MyNewterra"
  }
