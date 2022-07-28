resource "aws_launch_configuration" "ASG_web_lacf" {
  name                 = "ASG-web-lacf"
  image_id             = aws_ami_copy.ami-nginx.id
  instance_type        = "t2.micro"  ## 프리티어
  security_groups      = [aws_security_group.WEB-sg.id]  ## 보안그룹 web
  key_name             = "team.key"
} ## ec2 user_data에서 enable 안 먹을 때를 대비한 user data


## 콘솔에서 만들어둔 ami copy
resource "aws_ami_copy" "ami-nginx" {
  name              = "ami-nginx"
  description       = "A copy of ami-0e44e068ae54bbab0"
  source_ami_id     = "ami-0e44e068ae54bbab0"
  source_ami_region = "ap-northeast-2"

  tags = {
    Name = "ami-nginx"
  }
}