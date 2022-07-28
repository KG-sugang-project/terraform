resource "aws_lb" "ALB_ex" {
  name               = "ALB-ex"
  internal           = false  ## external
  load_balancer_type = "application"
  security_groups    = [aws_security_group.LB-1-sg.id]     
  subnets            = [aws_subnet.PUB_a.id,aws_subnet.PUB_c.id] 
  tags = {
    name = "ALB-ex"
  }
}
