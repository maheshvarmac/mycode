resource "aws_instance" "MyEC2" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  tags {
    name = "terraform-ec2"
  }
}

  resource "aws_default_vpc" "sample" {
  tags = {
    Name = "sample"
  }
}

resource "aws_subnet" "sample" {
  vpc_id     = aws_default_vpc.sample.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sample"
  }
}
