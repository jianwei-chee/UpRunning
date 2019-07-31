resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "main" {
  cidr_block = "${var.subnet_cidr}"
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "MainSub"
  }
}