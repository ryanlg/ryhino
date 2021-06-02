resource "aws_route53_record" "prontonmail_dkim" {
  zone_id = aws_route53_zone.bedrock.zone_id

  for_each = { for dkim in var.protonmail_dkim : dkim.name => dkim }

  name = each.value.name
  type = "CNAME"
  ttl  = 1440

  records = [each.value.record]
}
