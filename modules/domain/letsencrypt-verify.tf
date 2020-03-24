resource "aws_route53_record" "lets_encrypt_verify" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "_acme-challenge"
  type = "TXT"
  ttl  = "1440"

  records = var.lets_encrypt_txt
}
