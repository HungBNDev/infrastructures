resource "aws_lb_target_group" "staging" {
  name     = "staging-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 10
    matcher = 200
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 3
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "staging" {
  target_group_arn = aws_lb_target_group.staging.arn
  target_id        = aws_instance.staging.id
  port             = 80
}

resource "aws_lb" "staging" {
  name               = "staging-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.staging.id]
  subnets            = var.subnet_ids

  tags = {
    Environment = "staging"
  }
}

resource "aws_lb_listener" "staging" {
  load_balancer_arn = aws_lb.staging.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:ap-southeast-1:374302543993:certificate/f5bcded4-57e1-4b3c-88f9-1069752e5650"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.staging.arn
  }
}

resource "aws_lb_listener" "staging_http" {
  load_balancer_arn = aws_lb.staging.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.staging.arn
  }
}
