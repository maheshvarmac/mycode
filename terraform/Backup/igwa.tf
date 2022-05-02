resource "aws_internet_gateway_attachment" "main" {
  internet_gateway_id = "aws_internet_gateway.main.id"
  vpc_id              = "aws_vpc.main.id"
}
