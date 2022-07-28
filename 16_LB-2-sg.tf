resource "aws_security_group" "LB-2-sg" {
  name        = "LB-2-sg"
  description = "allow 80 from WEB"
  vpc_id      = aws_vpc.team_VPC.id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "LB-2-sg"
  }
}

resource "aws_security_group_rule" "LB-2-sg-HTTP" {
  type              = "ingress"
  description       = "HTTP"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  security_group_id = aws_security_group.LB-2-sg.id ## 인바운드 규칙을 추가할 보안그룹 id
  source_security_group_id = aws_security_group.WEB-sg.id ## 인바운드 규칙의 Source 보안그룹
}