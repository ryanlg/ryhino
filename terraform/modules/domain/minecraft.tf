resource "aws_route53_record" "minecraft_vanilla_srv" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name    = "_minecraft._tcp.minecraft"
  type    = "SRV"
  ttl     = "300"

  records = [
    "0 5 27315 conduit.ryanl.io"
  ]
}
