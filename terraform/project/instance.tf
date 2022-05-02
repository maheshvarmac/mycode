provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "project" {
  count = 1
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  key_name      = "mdcloud1"
#  vpc_security_group_ids      = ["${aws_security_group.frontendsg.id}"]
  associate_public_ip_address = true
  tags = {
     Name = "EC2-key-pair}"
  }
}

resource "aws_vpc" "project_vpc" {
  cidr_block = "10.70.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "EC2-Key-Pair-Testing"
    location = "Hoskote"
  }
}

resource "aws_default_vpc" "project_vpc" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_key_pair" "keypair" {
  key_name = "mdcloud1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHlfP7Nhca2BP1Yi6FARlUK/Oy/f2ISu6msbIpA2E/kkJ9pBqW5P7MOL8wJbBOndvi3zO5sdAvcQxvbV4cU8n84AuCFVN7AYKQfDOnttejbUeO2IXoOAKqjKQcRVLLHW5BKutDCIu2dUhOdcMDYid1nzfL2P+QJxz3REfpYJxutVjtJd3hDuI0SSfzFn7BN0UpwLOiaLfM9tpvQLqTUSKMQQkjPEe+r09f60qnIr73AwynsAgmH4lgqqIjSy/Gbft3qRB+RuzNxXX9FI8pc/feGGvKdCGUGOgUj0KC9XIg/7AU26xxP2gDKNqTlRH3CyxcZPVFV5U+sd8zMaIl2t843UtcoPHhYXx+2BxIaTBD+c/2WD5awlLl2jD5GPHCaX++ZsSBTRDr03Q5RuHD6FJIyOeasUxRkF1vnN3dTf725b4kcsnl+l+eyla7qPmnWXpCLQZqnu1AxrxKaXG8iIqsc9ceBf+A/+M/7PI2G5zBddujWSJIp8s97asNhR0F540= root@ip-10-20-1-164"

}

# variable "vpc_cidr" {
#   default = "10.30.0.0/16"
# }
