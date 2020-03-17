resource "aws_route53_record" "ec2_jumper" {
  zone_id = aws_route53_zone.bedrock.zone_id

  name = "jumper"
  type = "CNAME"
  ttl  = "3600"

  records = [data.aws_instance.ec2_jumper.public_dns]
}
