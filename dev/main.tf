provider "aws" {
  region = "ap-southeast-1"
}

module "my_vpc"{
  source = "./modules/vpc"
  vpc_cidr = "192.168.0.0/16"
  tenancy = "default"
  vpc_id = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source = "./modules/instance"
  ec2_count = 1
  instance_type = "t2.micro"
  subnet_id = "${module.my_vpc.subnet_id}"
  ami_id = "ami-0dad20bd1b9c8c004"
}