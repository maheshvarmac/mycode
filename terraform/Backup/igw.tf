resource "aws_internet_gateway" "gw" {
  vpc_id = "vpc-01ab76c24c661f4b2"

  tags = {
    Name = "main"
  }
}
