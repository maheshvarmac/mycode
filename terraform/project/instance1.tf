resource "aws_instance" "project" {
  count = 1
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  tags = {
     Name = "testing-ansible}"
  }
}
