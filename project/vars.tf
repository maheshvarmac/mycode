# Attaching variables to main file

variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "subnet_cidr" {
  type = list
  default = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"]
}

variable "azs" {
  type = list
#  default = ["ap-south-1a","ap-south-1b"]
  default = ["ap-south-1a"]
}

# variable "instance_type" {
#   default = t2.micro
# }

# # Declare the data source
# data "aws_availability_zones" "azs" {}

# variable "subnet_names" {
#   type = list
#   default = ["Pulic-Subnet1","Pulic-Subnet2","Private-Subnet1","Private-Subnet2","DB-Subnet1","DB-Subnet2"]
# }

# variable "subnet_cidr" {
#   type = string
# }


