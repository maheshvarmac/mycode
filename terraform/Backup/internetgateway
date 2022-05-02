data  "aws_vpc" "main" {
  id = "vpc-08c0ec16368e9543c"
}

resource "aws_internet_gateway" "main" {
  vpc_id = data.aws_vpc.main.id

  tags = {
  Name = "main"
  }
}
