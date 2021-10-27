output "ryanl_route53_bedrock_zone" {
  value       = aws_route53_zone.bedrock
  description = "Route53 zone for `bedrock`"
}
