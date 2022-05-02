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
      security_groups = [aws_security_group.databasesg.id]
  }

  egress {
      from_port   = 32768
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        Name = "Database SG"
  }
}