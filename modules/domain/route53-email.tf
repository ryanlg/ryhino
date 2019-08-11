resource "aws_route53_record" "bedrock_email_forwarding" {
  zone_id = "${aws_route53_zone.bedrock.zone_id}"

  name = ""
  type = "MX"
  ttl  = "3600"

  records = var.ryanl_google_domain_email_servers
}
