resource "aws_route53_record" "jumper_public" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "jumper"
  type = "A"
  ttl  = "3600"

  records = [
    var.ec2_jumper_ips.public
  ]
}
