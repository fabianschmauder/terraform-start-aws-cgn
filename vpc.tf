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

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.web-server-vpc.id
}

resource "aws_instance" "web-server" {
  ami           = "ami-09439f09c55136ecf" 
  instance_type = "t2.micro"
  subnet_id = aws_subnet.first-subnet.id
}