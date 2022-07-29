resource "aws_route53_record" "cname_rec1" {
  zone_id = aws_route53_zone.Route53_primary.zone_id
  name    = "www.kguniv.xyz"
  type    = "CNAME"
  ttl     = "60"
  records = [aws_lb.ALB_ex.dns_name] ## 외부용 ALB와 연결
}
