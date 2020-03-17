locals {
  global_tags = {
    "under" = "bedrock"
  }

  bedrock_domain = "ryanl.io"

  email_servers = [
    "5 gmr-smtp-in.l.google.com",
    "10 alt1.gmr-smtp-in.l.google.com",
    "20 alt2.gmr-smtp-in.l.google.com",
    "30 alt3.gmr-smtp-in.l.google.com",
    "40 alt4.gmr-smtp-in.l.google.com"
  ]

  // @temporary: points to a Gitlab page for now, until Diamond gets set up
  blog_gitlab_record = ["ryanlio.gitlab.io."]

  gitlab_verify = ["gitlab-pages-verification-code=4ec1d93607f9afa77f4123af74dba0e1"]
}


module "ryanl_domain" {
  source = "../../modules/domain"

  global_tags = local.global_tags
  ryanl_domain_bedrock = local.bedrock_domain
  ryanl_google_domain_email_servers = local.email_servers
  ryanl_domain_blog_gitlab_record = local.blog_gitlab_record
  ryanl_domain_gitlab_verify_record = local.gitlab_verify
}
