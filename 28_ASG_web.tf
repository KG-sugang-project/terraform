# resource "aws_placement_group" "jylee_pg" {  ## 배치그룹
#   name     = "jylee-pg"
#   strategy = "cluster" ## 배치전략 단위 : 짧은 네트워크 지연 시간, 높은 네트워크 처리량을 요하는 애플리케이션에 권장
# }

resource "aws_autoscaling_group" "ASG_web" {
  name                      = "ASG-web"
  max_size                  = 10
  min_size                  = 2
  desired_capacity          = 2  ## 원하는 갯수
  health_check_grace_period = 60 ## 헬스체크까지 대기 시간 (초)
  health_check_type         = "EC2"
  force_delete              = false ## 인스턴스 완전 종료전에 대기 않고 ASG 삭제 허용
  launch_configuration      = aws_launch_configuration.ASG_web_lacf.name  ## 시작 구성
  vpc_zone_identifier       = [aws_subnet.WEB_a.id, aws_subnet.WEB_c.id] 
}

## 정책
resource "aws_autoscaling_policy" "web_target_tracking_policy" {
  name = "web-target-tracking-policy"
  policy_type = "TargetTrackingScaling"  ## 대상 추적 크기 조정 정책
  autoscaling_group_name = "${aws_autoscaling_group.ASG_web.name}"
  estimated_instance_warmup = 200  ## 새로 시작한 인스턴스가 CloudWatch 지표에 기여할 때까지의 예상 시간

## 정책 인수
target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization" ## 평균 CPU 사용률
  }
  target_value = 40.0  ## 대상값
}
# target_tracking_configuration {
#   customized_metric_specification {
#     metric_dimension {
#       name = "fuga"
#       value = "fuga"
#     }
#     metric_name = "hoge"
#     namespace = "hoge"
#     statistic = "Average"
#   }
#   target_value = 40.0
# }
}