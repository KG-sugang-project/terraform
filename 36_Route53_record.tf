resource "aws_route53_record" "rec1" {
  zone_id = "${aws_route53_zone.Route53_primary.zone_id}"
  name    = "www"
  type    = "A"

  alias {
    name                   = "${aws_lb.ALB_ex.dns_name}"
    zone_id                = "${aws_lb.ALB_ex.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "rec2" {
  zone_id = "${aws_route53_zone.Route53_primary.zone_id}"
  name    = ""
  type    = "A"

  alias {
    name                   = "${aws_lb.ALB_ex.dns_name}"
    zone_id                = "${aws_lb.ALB_ex.zone_id}"
    evaluate_target_health = true
  }
}