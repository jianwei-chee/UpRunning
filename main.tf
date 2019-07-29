provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami = "ami-01f7527546b557442"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}