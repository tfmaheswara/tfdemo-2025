provider "aws" {
  region = var.region
  
}

/*
data "aws_ami" "ubuntu_ami" {
  filter {
    name   = "ubuntu-eks-pro/k8s_1.30/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240830"
    values = ["ami-0004facbfb2f47dd8"]
  }
}
*/

resource "aws_instance" "web" {
  ami           = "ami-0000791bad666add5"
  instance_type = "t2.micro"
  #instance_type = var.typeofinstace
  subnet_id     = "subnet-01b2e6905e667ab81"
  security_groups = ["sg-0043de2da52bdff41", "sg-07905bd9a7b33776e"]
  tags = {
    Name = "HelloWorld"
  }
  #tags = local.common_tags
}


output "instance_ip" {
  value = aws_instance.web.public_ip
}


locals {
  keyname1 = "testdemo"
  keynae2 = "instancevalue"
}