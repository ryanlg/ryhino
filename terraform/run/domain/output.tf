output "ryanl_route53_bedrock_zone_name_servers" {
  value       = module.ryanl_domain.ryanl_route53_bedrock_zone.name_servers
  description = "Route53 name servers for bedrock"
}

output "route53_bedrock_zone_id" {
  value       = module.ryanl_domain.ryanl_route53_bedrock_zone.zone_id
  description = "Route53 zone id for bedrock"
}
