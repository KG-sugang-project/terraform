## 주제 생성 > 주제 이메일 구독 > 구독 확인 > 

## 알림을 발송할 주제 ARN
resource "aws_sns_topic" "ASG_instance_updown" {
  name = "ASG-instance-updown"
  # arn is an exported attribute
}

## 구독할 이메일
resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.ASG_instance_updown.arn
  protocol  = "email"
  endpoint  = "ddw9423@gmail.com"
}

## ASG에 대한 Amazon SNS 알림을 구성
resource "aws_autoscaling_notification" "example_notifications" {
  group_names = [
    "${aws_autoscaling_group.ASG_web.name}",
    "${aws_autoscaling_group.ASG_was.name}",
  ]
  ## 알림을 트리거하는 알림 유형 목록
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",       # 인스턴스 시작
    "autoscaling:EC2_INSTANCE_TERMINATE",    # 인스턴스 종료
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR", # 인스턴스 시작 오류
  ]

  topic_arn = aws_sns_topic.ASG_instance_updown.arn
}

