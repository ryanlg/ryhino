resource "aws_route53_record" "sky_blog_gitlab" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "blog"
  type = "CNAME"
  ttl  = "30"

  records = var.ryanl_domain_blog_gitlab_record
}
