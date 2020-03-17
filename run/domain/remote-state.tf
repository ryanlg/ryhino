data "terraform_remote_state" "bedrock" {
  backend = "remote"

  config = {
    hostname     = "app.terraform.io"
    organization = "ryanl"

    workspaces   = {
      name = "ryanl-bedrock-concrete"
    }
  }
}

