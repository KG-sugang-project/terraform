resource "aws_security_group" "DB-sg" {
  name        = "DB-sg"
  description = "allow 3306/tcp from WAS, 22 from Bastion"
  vpc_id      = aws_vpc.team_VPC.id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "DB-sg"
  }
}


resource "aws_security_group_rule" "DB-sg-MYSQL" { ## 보안그룹 룰 추가
  type                     = "ingress"             ## 인바운드 규칙
  description              = "MYSQL"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.DB-sg.id  ## 인바운드 규칙을 추가할 보안그룹 id
  source_security_group_id = aws_security_group.WAS-sg.id ## 인바운드 규칙의 Source 보안그룹
}

resource "aws_security_group_rule" "DB-sg-Bastion" { ## 보안그룹 룰 추가
  type                     = "ingress"             ## 인바운드 규칙
  description              = "MYSQL"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.DB-sg.id  ## 인바운드 규칙을 추가할 보안그룹 id
  source_security_group_id = aws_security_group.Bastion-sg.id ## 인바운드 규칙의 Source 보안그룹
}
