locals {

  global_tags = {
    "under" = "bedrock"
  }
}

data "terraform_remote_state" "domain" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "ryanl"

    workspaces   = {
      name = "ryanl-domain-bedrock-concrete"
    }
  }
}

module "ryanl_bedrock" {
    source = "../../modules/bedrock"

    route53_bedrock_zone_id = data.terraform_remote_state.domain.outputs.route53_bedrock_zone_id
    global_tags = local.global_tags
}
