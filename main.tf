provider "aws" {
  region = var.region
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_amazon_linux.id #data.aws_ami.latest_amazon_linux.id  #"ami-0000791bad666add5"
  instance_type = "t2.micro"
  #instance_type = var.typeofinstace
  subnet_id     = ["subnet-0e64e73bac365a9af"]
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