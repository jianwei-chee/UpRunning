provider "aws" {
  region = "ap-southeast-1"
}
module "server" {
  source = "./server"
}

/*
aws instance only
resource "aws_instance" "example" {
  ami                    = "ami-0dad20bd1b9c8c004"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
    Name = "terraform-example"
  }

}



// autoscalling group
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier = data.aws_subnet_ids.default.ids

  min_size = 2
  max_size = 10

  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}
//resource "aws_lb_target_group " "" {}

module "aws_launch_config" {11
  source = "./server"
  security_groups = "${aws_security_group.instance.id}"
  server_portM = "${var.server_port}"

}

resource "aws_launch_configuration" "example" {


  image_id = "ami-0dad20bd1b9c8c004"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.instance.id]
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p
              ${var.server_port} &
              EOF
}


resource "aws_lb" "example" {
  name = "terraform-asg-example"
  load_balancer_type = "application"
  subnets = data.aws_subnet_ids.default.ids
  security_groups = [aws_security_group.alb.id]
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.example.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found JW"
      status_code = 404
    }
  }
}
*/

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" { // will be filled after subnet is setup
  vpc_id = data.aws_vpc.default.id
}
/*
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port = var.server_port
    to_port = var.server_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "alb" {
  name = "terraform-example-alb"
  # Allow inbound HTTP requests
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Allow all outbound requests
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
*/
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type = number
  default = 8080
}
/*
output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}
*/