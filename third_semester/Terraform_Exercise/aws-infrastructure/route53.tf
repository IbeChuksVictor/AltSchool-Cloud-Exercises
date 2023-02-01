resource "aws_route53_zone" "ASTE-zone" {
  name = var.domain-name
}

resource "aws_route53_record" "ASTE-A" {
  zone_id = aws_route53_zone.ASTE-zone.zone_id
  name    = var.sub_domain_name
  type    = "A"

  alias {
    name                   = aws_lb.ASTE-lb.dns_name
    zone_id                = aws_lb.ASTE-lb.zone_id
    evaluate_target_health = true
  }
}