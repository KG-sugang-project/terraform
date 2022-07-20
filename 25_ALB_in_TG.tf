resource "aws_lb_target_group" "ALB_in_tg" {
  name        = "ALB-in-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.team_VPC.id

  health_check {
    enabled             = true
    healthy_threshold   = 3 ## 타겟 상태 확정전 확인 횟수
    unhealthy_threshold = 3
    interval            = 5              ## 헬스체크 사이의 시간 (초)
    matcher             = "200"          ## 프로토콜별 요구되는 응답코드
    path                = "/index.html"  ## 상태 확인 요청 대상
    port                = "traffic-port" ## 기본값. 혹은 1~65535
    protocol            = "HTTP"
    timeout             = 2 ## 응답없음 상태가 상태확인에 실패했음을 의미하는 시간
  }
}