resource "aws_instance" "demo" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  tags = {
     Name = "Testing-Terraform-1"
  }
}
