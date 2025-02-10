provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"  # Change based on your AWS region
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
output "instance_ip" {
  value = aws_instance.my_ec2.public_ip
}
