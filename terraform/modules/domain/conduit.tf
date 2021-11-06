resource "aws_route53_record" "conduit" {
  # conduit.ryanl.io
  # A record to the public IP of bedrock network
  # This is managed by the Dynamic DNS on pfsense deployed on bedrock. It will modify
  # this record whenever the public IP changes.

  zone_id = aws_route53_zone.bedrock.zone_id

  name    = "conduit"
  type    = "A"
  ttl     = "180"       # Keeping this low because this should be managed by Dynamic DNS

  # Actual IP will be filled in by Dynamic DNS. So here we just have a placeholder.
  records = ["0.0.0.0"]

  lifecycle {
    ignore_changes = [
      # This resource is only used to managed to create the record so pfsesne
      # know where to put the IP. Actual IP should NOT be managed by terraform.
      records,
    ]
  }
}
