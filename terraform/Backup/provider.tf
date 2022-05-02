provider "aws" {
  region  = "ap-south-1"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags {
    Name = "main"
    location = "Bangalore"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"

  tags {
    Name = "Subnet1"
  }
}
