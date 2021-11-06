output "ryanl_vpc_bedrock_id" {
  value = module.ryanl_bedrock.ryanl_vpc_bedrock.id
}

output "pfsense_dynamic_dns_user_access_key" {
  value = module.ryanl_bedrock.pfsense_dynamic_dns_user_access_key
  description = "Access key-pair for the IAM user designated to the Dynamic DNS on pfsense"

  sensitive = true
}
