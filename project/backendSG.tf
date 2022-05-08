# Create Database Security Group

resource "aws_security_group" "backendsg" {
  name        = "Backend SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
      description     = "Allow traffic from application layer"
      from_port       = 8080
      to_port         = 8080
      protocol        = "tcp"
      security_groups = [aws_security_group.frontendsg.id]
  }

# SSH access from anywhere
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port   = 8989
      to_port     = 8989
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        Name = "Backend SG"
  }
}

