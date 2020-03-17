resource "aws_route53_record" "sky_gitlab_verify" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "_gitlab-pages-verification-code.blog"
  type = "TXT"
  ttl  = "1440"

  records = var.ryanl_domain_gitlab_verify_record
}
