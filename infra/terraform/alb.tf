#define application load balancer and it's type
resource "aws_lb" "external-alb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg-dev.id]
  subnets            = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]
}

#define TG and health check endpoint
resource "aws_lb_target_group" "target_elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.service-vpc.id
  health_check {
    path     = "/health"
    port     = 80
    protocol = "HTTP"
  }
}

#attach first instance to load balancing
resource "aws_lb_target_group_attachment" "web-service-node1" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = aws_instance.web-service-node1.id
  port             = 80
  depends_on = [
    aws_lb_target_group.target_elb,
    aws_instance.web-service-node1,
  ]
}

#attach second instance to load balancing
resource "aws_lb_target_group_attachment" "web-service-node2" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = aws_instance.web-service-node2.id
  port             = 80
  depends_on = [
    aws_lb_target_group.target_elb,
    aws_instance.web-service-node1,
  ]
}

#define external listem port anf proxying type
resource "aws_lb_listener" "listener_elb" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_elb.arn
  }
}
