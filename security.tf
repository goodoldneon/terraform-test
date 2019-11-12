resource "aws_security_group" "allow-ping" {
  name   = "allow-ping"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]

    from_port = -1
    to_port   = -1
    protocol  = "icmp"
  }

  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ping"
  }
}

resource "aws_security_group" "allow-ssh" {
  name   = "allow-ssh"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}