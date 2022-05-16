# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "FrontEnd-PC" {
  ami                         = "ami-0851b76e8b1bce90b"
  instance_type               = "t2.micro"
  count                       = length(var.azs)
  key_name                    = "mdcloud1"
  vpc_security_group_ids      = [aws_security_group.frontendsg.id]
  subnet_id                   = element(aws_subnet.public.*.id, count.index)
  associate_public_ip_address = true
  # user_data                   = "${file("data.sh")}"
tags = {
    Name = "FrontEnd-PC-${count.index+1}"
  }
}

resource "aws_instance" "Backend-PC" {
  ami                         = "ami-0851b76e8b1bce90b"
  instance_type               = "t2.micro"
  count                       = length(var.azs)
  key_name                    = "mdcloud1"
  vpc_security_group_ids      = [aws_security_group.backendsg.id]
  subnet_id                   = element(aws_subnet.private.*.id, count.index)
  associate_public_ip_address = true
  # user_data                   = "${file("data.sh")}"
tags = {
    Name = "Backend-PC-${count.index+1}"
  }
}

resource "aws_instance" "Database-PC" {
  ami                         = "ami-0851b76e8b1bce90b"
  instance_type               = "t2.micro"
  count                       = length(var.azs)
  key_name                    = "mdcloud1"
  vpc_security_group_ids      = [aws_security_group.databasesg.id]
  subnet_id                   = element(aws_subnet.database.*.id, count.index)
  associate_public_ip_address = true
  # user_data                   = "${file("data.sh")}"
tags = {
    Name = "Database-PC-${count.index+1}"
  }
}

# # Creating 2nd EC2 instance in Public Subnet
# resource "aws_instance" "demoinstance1" {
#   ami                         = "ami-087c17d1fe0178315"
#   instance_type               = "t2.micro"
#   count                       = 1
#   key_name                    = "tests"
#   vpc_security_group_ids      = ["${aws_security_group.frontendsg.id}"]
#   subnet_id                   = "${aws_subnet.demoinstance.id}"
#   associate_public_ip_address = true
#   user_data                   = "${file("data.sh")}"
# tags = {
#     Name = "My Public Instance 2"
#   }
# }

