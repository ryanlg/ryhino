resource "aws_route53_record" "proton_mail_verify" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = ""
  type = "TXT"
  ttl  = "1440"

  records = var.protonmail_txt
}
