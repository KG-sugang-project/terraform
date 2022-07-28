resource "aws_lb_listener" "ALB_in_listener" {
  load_balancer_arn = aws_lb.ALB_in.arn        ## ALB에 리스너 연결
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"                 ## 대상그룹 쪽으로 Forwarding
    target_group_arn = aws_lb_target_group.ALB_in_tg.arn  ## 대상그룹
  }
}