resource "aws_vpc" "web-server-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "first-subnet" {
  vpc_id     = aws_vpc.web-server-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "This is the name"
  }
}

resource "aws_subnet" "second-subnet" {
  vpc_id     = aws_vpc.web-server-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "second"
  }
}