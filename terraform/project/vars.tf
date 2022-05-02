variable "region" {
  default = "ap-south-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr" {
  type = list
  default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
}
variable "azs" {
  type = list
  default = ["ap-south-1a","ap-south-1b"]
}
variable "igw" {
  default = "aws_vpc.main.id"
}
variable "ec2_ami" {
  type = map

  default = {
    ap-south-1a = "ami-0851b76e8b1bce90b"
    ap-south-1b = "ami-0851b76e8b1bce90b"
  }
}
variable "instance_type" {
  type = "string"
}
