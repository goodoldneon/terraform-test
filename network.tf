resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-1"
  }
}

resource "aws_eip" "ip-1" {
  instance = "${aws_instance.server-1.id}"
  vpc      = true
}
