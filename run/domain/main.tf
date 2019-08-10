locals {
  global_tags = {
    "under" = "bedrock"
  }

  bedrock_domain = "ryanl.io"
}


module "ryanl_domain" {
  source = "../../modules/domain"

  global_tags = local.global_tags
  ryanl_domain_bedrock = local.bedrock_domain
}
