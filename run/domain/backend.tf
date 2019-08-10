terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ryanl"

    workspaces {
      name = "ryanl-domain-bedrock-concrete"
    }
  }
}
