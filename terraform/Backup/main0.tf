provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "demo" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  tags = {
     Name = "Testing-Terraform-1"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "main"
    location = "Bangalore"
  }
}

resource "aws_subnet" "subnets" {
  count = "${length(var.azs)}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.subnet_cidr,count.index)}"

    tags = {
     Name = "Subnet-${count.index+1}"
   }
 }

resource "aws_internet_gateway" "gw" {
  vpc_id = "vpc-01ab76c24c661f4b2"

  tags = {
    Name = "main"
  }
}
resource "aws_internet_gateway_attachment" "main" {
  internet_gateway_id = "aws_internet_gateway.main.id"
  vpc_id              = "aws_vpc.main.id"
}
