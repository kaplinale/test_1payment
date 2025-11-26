resource "aws_instance" "web-service-node1" {
  ami                         = "centos_7"
  instance_type               = "t2.micro"
  key_name                    = "web-service"
  vpc_security_group_ids      = [aws_security_group.web-sg-dev.id]
  subnet_id                   = aws_subnet.public-subnet1.id
  associate_public_ip_address = true
  tags = {
    name = "ec2-1"
  }
}

resource "aws_instance" "web-service-node2" {
  ami                         = "ubuntu_2404"
  instance_type               = "t2.micro"
  key_name                    = "web-service"
  vpc_security_group_ids      = [aws_security_group.web-sg-dev.id]
  subnet_id                   = aws_subnet.public-subnet1.id
  associate_public_ip_address = true
  tags = {
    name = "ec2-2"
  }
}