locals {

  global_tags = {
    "under" = "bedrock"
  }
}

module "ryanl_bedrock" {
    source = "../../modules/bedrock"

    global_tags = local.global_tags
}
