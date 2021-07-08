resource "aws_lb_target_group" "main" {
  name     = "${var.app_name}-${terraform.workspace}-tg"
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
  health_check {
    healthy_threshold = var.healthy_threshold
    interval = var.interval
    path = var.path
    port = var.port
    protocol = var.protocol
    unhealthy_threshold = var.unhealthy_threshold
  }
}

resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = var.target_id
  port             = var.port
}