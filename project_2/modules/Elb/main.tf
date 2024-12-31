# modules/elb/main.tf
resource "aws_lb" "web_lb" {
  name                       = "web-lb"
  internal                   = false
  load_balancer_type         = "application"
  # security_groups            = var.security_groups
  subnets                    = var.subnets
  enable_deletion_protection = false
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 4
    interval            = 10
  }
}

resource "aws_lb_listener_rule" "aws_lb_listener_rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
  condition {
    path_pattern {
      values = ["*"]
    }
  }

}