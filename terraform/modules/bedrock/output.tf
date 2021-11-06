output "ryanl_vpc_bedrock" {
  value = aws_vpc.bedrock
}

output "pfsense_dynamic_dns_user_access_key" {
  value = {
    id     = aws_iam_access_key.pfsense_dynamic_dns.id
    secret = aws_iam_access_key.pfsense_dynamic_dns.secret
  }

  description = "Access key-pair for the IAM user designated to the Dynamic DNS on pfsense"

  sensitive = true
}
