# ##Route 53 Zone(도메인) 등록
# resource "aws_route53_zone" "Route53_primary_test" { 
#   name = "test.xyz" 
# }

# # resource "aws_route53_record" "cname_rec3" {
# #   zone_id = aws_route53_zone.Route53_primary_test.zone_id
# #   name    = "test.xyz"
# #   type    = "CNAME"
# #   ttl     = "60"
# #   records = [aws_lb.ALB_ex.dns_name] ## 외부용 ALB와 연결
# # }

# resource "aws_route53_record" "cname_rec4" {
#   zone_id = aws_route53_zone.Route53_primary_test.zone_id
#   name    = "www.test.xyz"
#   type    = "A"
#   ttl     = "60"
#   records = [aws_lb.ALB_ex.dns_name] ## 외부용 ALB와 연결
# }
