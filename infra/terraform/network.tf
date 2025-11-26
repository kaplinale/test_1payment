resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.service-vpc.id
  cidr_block              = var.vpc_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public-subnet1"
  }
}
#public-subnet2 creation
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.service-vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"
  tags = {
    Name = "public-subnet2"
  }
}
#private-subnet1 creation
resource "aws_subnet" "private-subnet1" {
  vpc_id            = aws_vpc.service-vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet1"
  }
}