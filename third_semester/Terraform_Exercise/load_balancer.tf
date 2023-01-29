# Create an Application load balancer
resource "aws_lb" "ASTE-lb" {
  name                       = "${var.project_name}-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.ASTE-lb-sg.id]
  subnets                    = [aws_subnet.ASTE-subnets["sub-1"].id, aws_subnet.ASTE-subnets["sub-2"].id, aws_subnet.ASTE-subnets["sub-3"].id]
  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-lb"
  }
}

# Create a target group for the load balancer
resource "aws_lb_target_group" "ASTE-lb-tg" {
  name        = "${var.project_name}-lb-tg"
  port        = var.http_port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.ASTE-vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 300
    path                = "/"
    port                = var.http_port
    protocol            = "HTTP"
    timeout             = 60
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project_name}-lb-tg"
  }
}

# Add a listener to the load balancer
resource "aws_lb_listener" "ASTE-lb-http-listener" {
  load_balancer_arn = aws_lb.ASTE-lb.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.ASTE-lb-tg.arn
    type             = "forward"
  }
}
  