resource "aws_lb" "web_lb" {
  name               = "web-app-simple-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnets
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-app-simple-tag"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "nginx_a" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = var.instance_ids[0]
  port             = 80
}

resource "aws_lb_target_group_attachment" "nginx_b" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = var.instance_ids[1]
  port             = 80
}
