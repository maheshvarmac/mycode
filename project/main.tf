provider "aws" {
  region = var.region
}

# createing the VPC - project_vpc with vpc_cidr is in var file
resource "aws_vpc" "project_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "project_vpc"
    location = "Hoskote"
  }
}

# resource "aws_instance" "autos" {
#   count = 1
#   ami           = "ami-0851b76e8b1bce90b"
#   instance_type = "t2.micro"
#   tags = {
#      Name = "project-${count.index+1}"
#   }
# }

# resource "aws_subnet" "assign_subnets" {
#   count = "${length(data.aws_availability_zones.azs.names)}"
#   availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
#   vpc_id     = "${aws_vpc.assign_vpc.id}"
#   cidr_block = "${element(var.subnet_cidr,count.index)}"

#   tags = {
#     Name = "assign_subnet-${count.index+1}"
#   }
# }

# Creating First public subnet with AZ, subnet cidr, with public ip.
resource "aws_subnet" "public" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = element(var.subnet_cidr, count.index)
  availability_zone       = element(var.azs,count.index)
  map_public_ip_on_launch = false

  tags = {
      Name = "Public-Subnet-${count.index+1}"
    }
}

resource "aws_subnet" "private" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = element(var.subnet_cidr, count.index+2)
  availability_zone       = element(var.azs,count.index)
  map_public_ip_on_launch = false

  tags = {
      Name = "Private-Subnet-${count.index+1}"
    }
}

resource "aws_subnet" "database" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = element(var.subnet_cidr, count.index+4)
  availability_zone       = element(var.azs,count.index)
  map_public_ip_on_launch = false

  tags = {
      Name = "Database-Subnet-${count.index+1}"
    }
}

#resource "aws_eip" "eip-nat" {
#  vpc = true
#
#  tags = {
#    Name = "EIP1"
#  }
#
#}

# resource "aws_nat_gateway" "main" {
#   count                   = "${length(var.azs)}"
#   subnet_id               = "${element(aws_subnet.public.*.id, count.index)}"
#   allocation_id           = aws_eip.eip-nat.id
#
#   tags = {
#       Name = "NAT-${element(var.azs, count.index)}"
#     }
# }

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "public route table - project"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "project"
  }
}

resource "aws_route" "public_internet_gateway" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
    count = length(var.azs)

    subnet_id = element(aws_subnet.public.*.id, count.index)
    route_table_id = aws_route_table.public.id
}

# resource "aws_launch_configuration" "autos" {
#   name_prefix   = "terraform-lc-example-"
#   image_id      = data.aws_ami.ubuntu.id
#   instance_type = "t2.micro"
# 
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# resource "aws_autoscaling_group" "autos" {
#     Name = "${aws_launch_configuration.autos.name}-asg"
# 
#     min_size = 0
#     desired_capacity = 1
#     max_size = 1
#     health_check_type = "EC2"
#     launch_configuration = "${aws_launch_configuration.autos.name}"
#     vpc_zone_identifier = ["${aws_subnet.public.*.id}"]
# 
#     tags = [
#       {
#         key = "Name"
#         value = "autos"
#         propagate_at_launch = "true"
#     }
#   ]
# 
#   lifecycle {
#     create_before_destroy = true
#   }
# }
