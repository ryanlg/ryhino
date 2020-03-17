resource "aws_route53_zone" "bedrock" {
  name = var.ryanl_domain_bedrock

  tags = var.global_tags
}
