resource "aws_security_group" "allow_all_outbound" {
  name = "allow_all_outbound"
  description = "Allow outbound traffic"

  vpc_id = "${aws_vpc.gitlab.id}"

# outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Allow outbound traffic"
  }
}

resource "aws_security_group" "allow_ssh_ip" {
  name = "allow_ssh_ip"
  description = "Allow inbound SSH traffic from my IP"
  vpc_id = "${aws_vpc.gitlab.id}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${var.ssh_access_from_cidr}"]
  }

  tags {
    Name = "Allow SSH"
  }
}

resource "aws_security_group" "gitlab_web_server" {
  name = "gitlab web server"
  description = "Allow HTTP traffic in, browser access out."
  vpc_id = "${aws_vpc.gitlab.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["10.100.0.0/16"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}


