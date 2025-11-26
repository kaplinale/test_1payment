resource "aws_lb" "example_alb" {
  name               = "example-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public-subnet1, aws_subnet.public-subnet2] # our subnets
  security_groups    = [aws_security_group.web-sg-dev.id] # our SG
}

data "aws_route53_zone" "example_zone" {
  name         = "cluster.lan." # Replace with your domain name
  private_zone = false
}

resource "aws_route53_record" "example_alias" {
  zone_id = data.aws_route53_zone.example_zone.zone_id
  name    = "service.cluster.lan" # The desired subdomain for your ALB
  type    = "A"

  alias {
    name                   = aws_lb.example_alb.dns_name
    zone_id                = aws_lb.example_alb.zone_id
    evaluate_target_health = true
  }
}