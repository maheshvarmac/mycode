resource "aws_subnet" "subnets" {
  count = "6"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.subnet_cidr,count.index)}"

    tags = {
     Name = "Subnet-${count.index+1}"
   }
 }
