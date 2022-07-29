##Route 53 Zone(도메인) 등록
resource "aws_route53_zone" "Route53_primary" { 
  name = "kguniv.xyz" 
}

