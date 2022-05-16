# Create Database Security Group

resource "aws_security_group" "databasesg" {
  name        = "Database SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
      description     = "Allow traffic from application layer"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      security_groups = [aws_security_group.frontendsg.id]
  }

  # Allow all traffic

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

# Outbound Rules
  # Internet access to anywhere
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port   = 33060
      to_port     = 33060
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        Name = "Database SG"
  }
}


