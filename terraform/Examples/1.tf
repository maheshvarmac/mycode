provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  tags = {
     Name = "Testing-Terraform-1"
  }
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    location = "Bangalore"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
 }
