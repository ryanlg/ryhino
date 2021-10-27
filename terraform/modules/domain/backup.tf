resource "aws_route53_record" "backup" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "backup"
  type = "A"
  ttl  = "3600"

  records = [
    var.ec2_jumper_ips.public
  ]
}
