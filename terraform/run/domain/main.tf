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

  protonmail_servers = [
    "10 mail.protonmail.ch",
    "20 mailsec.protonmail.ch"
  ]

  protonmail_dkim = [
    {
      name = "protonmail._domainkey",
      record = "protonmail.domainkey.d4w5t2h4zqey62762vjtz7v74ybfsqf7ye5npajrkxt4hspllro2a.domains.proton.ch."
    },
    {
      name = "protonmail2._domainkey",
      record = "protonmail2.domainkey.d4w5t2h4zqey62762vjtz7v74ybfsqf7ye5npajrkxt4hspllro2a.domains.proton.ch."
    },
    {
      name = "protonmail3._domainkey",
      record = "protonmail3.domainkey.d4w5t2h4zqey62762vjtz7v74ybfsqf7ye5npajrkxt4hspllro2a.domains.proton.ch."
    }
  ]

  lets_encrypt_txt = ["fzgdrWydd3ol6UulQ90Ashb7bNvBHWukTqdXSvS1rdA"]
  protonmail_txt   = [
    "protonmail-verification=4f793977cffc94e45c6fb377482accd12596bee4",
    "v=spf1 include:_spf.protonmail.ch mx ~all",
  ]

  ec2_jumper_ips   = data.terraform_remote_state.bedrock.outputs.ec2_jumper_ips
}


module "ryanl_domain" {
  source = "../../modules/domain"

  ryanl_domain_bedrock                    = local.bedrock_domain

  gmail_servers                           = local.gmail_server
  ec2_jumper_ips                          = local.ec2_jumper_ips
  lets_encrypt_txt                        = local.lets_encrypt_txt
  protonmail_txt                          = local.protonmail_txt
  protonmail_servers                      = local.protonmail_servers
  protonmail_dkim                         = local.protonmail_dkim

  global_tags                             = local.global_tags
}
