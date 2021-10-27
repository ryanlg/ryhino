resource "aws_route53_record" "jumper_tunnel" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "tunnel"
  type = "A"
  ttl  = "3600"

  records = [
    var.ec2_jumper_ips.tunnel
  ]
}
