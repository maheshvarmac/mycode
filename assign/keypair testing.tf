provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "FrontEnd-PC" {
  ami                         = "ami-0851b76e8b1bce90b"
  instance_type               = "t2.micro"
  key_name                    = "mdcolud"

tags = {
    Name        = "keypairtesting"
  }
}

resource "aws_key_pair" "key_pair" {
    key_name    = "mdcloud"
    public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgQSgL1HrTWkCd/TQU4Nc4MhH0/VQgezrJ75OtfXZaAItXActtI/4hiZyJ2B5/+Jjy8+8M8FntJjHSZAMqJ+d2ebY5jRwNyFySa0AhMX5s5zlPykZeKHQnAZxT493VpU4LumvqHVodCTnD8Z7UC9BLV/MWx3U776fohNUpFznurLWqOAVYQZif9QNRu5dpt24PrxbOVaGIGjSHn0fUXxas5+qNxjRuXfB+zYdBVxFEbqfBpvsqLKM9AeAh2B3/3QSWEzSVv9hJfqsrxPAx+Jzoda+CSOWOwTyo7yU0Gag1+L9i8zUJQOI0Dnc79slyrtndFDBpw9NFNx9NKmKKSZKZ"
}

resource "aws" "name" {
  
}

resource "aws_vpc" "name" {
  
}