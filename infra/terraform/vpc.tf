resource "aws_vpc" "service-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "service-vpc" 
  }
}