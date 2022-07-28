resource "aws_lb" "ALB_in" {
  name               = "ALB-in"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.LB-2-sg.id]     
  subnets            = [aws_subnet.WEB_a.id,aws_subnet.WEB_c.id] 
  tags = {
    name = "ALB-in"
  }
}

