resource "aws_route53_record" "minecraft" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "minecraft"
  type = "A"
  ttl  = "3600"

  records = [
    var.ec2_jumper_ips.public
  ]
}

resource "aws_route53_record" "minecraft_srv" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "_minecraft._tcp.minecraft"
  type = "SRV"
  ttl  = "3600"

  records = [
    "0 5 27315 minecraft.ryanl.io"
  ]
}