locals {
  global_tags = {
    "under" = "bedrock"
  }

  bedrock_domain = "ryanl.io"

  gmail_server = [
    "5 gmr-smtp-in.l.google.com",
    "10 alt1.gmr-smtp-in.l.google.com",
    "20 alt2.gmr-smtp-in.l.google.com",
    "30 alt3.gmr-smtp-in.l.google.com",
    "40 alt4.gmr-smtp-in.l.google.com"
  ]

  lets_encrypt_txt = ["fzgdrWydd3ol6UulQ90Ashb7bNvBHWukTqdXSvS1rdA"]

  ec2_jumper_ips   = data.terraform_remote_state.bedrock.outputs.ec2_jumper_ips
}


module "ryanl_domain" {
  source = "../../modules/domain"

  ryanl_domain_bedrock                    = local.bedrock_domain

  gmail_servers                           = local.gmail_server
  ec2_jumper_ips                          = local.ec2_jumper_ips
  lets_encrypt_txt                        = local.lets_encrypt_txt

  global_tags                             = local.global_tags
}
