variable "ryanl_domain_bedrock" {
  type        = string
  description = "Domain for `bedrock`, i.e. the main domain"
}

variable "global_tags" {
  description = "Global tags"
}

variable "ryanl_google_domain_email_servers" {

  type        = list(string)
  description = "Servers for email forwarding from Google Domain"
}

variable "ryanl_domain_blog_gitlab_record" {

  type        = list(string)
  description = "Domain for sky/blog@gitlab"
}

variable "ryanl_domain_gitlab_verify_record" {

  type        = list(string)
  description = "Verification for Gitlab Pages"
}

variable "ryanl_domain_lets_encrypt_verify_record" {

  type        = list(string)
  description = "Verification for Let's Encrypt"
}
