provider "aws" {
region = "us-east-1"
access_key = var.access_key
secret_key = var.secret_key
}


resource "aws_instance" "my-first-server" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = "abdul-key"
# the next 3 lines are needed to deploy to my custom VPC
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.My_VPC_Security_Group.id]
  subnet_id                   = aws_subnet.My_VPC_Subnet.id
  
  tags = {
    Name = "abdullah_instance"
  }
}


