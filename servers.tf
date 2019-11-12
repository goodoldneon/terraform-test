provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server-1" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  security_groups = [
    "${aws_security_group.allow-ping.id}",
    "${aws_security_group.allow-ssh.id}"
  ]

  subnet_id = "${aws_subnet.subnet-1.id}"

  tags = {
    Name = "server-1"
  }
}
