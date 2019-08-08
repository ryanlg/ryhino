resource "aws_vpc" "bedrock" {
    cidr_block = "10.0.0.0/16"

    enable_dns_support = true
    enable_dns_hostnames = true

    tags = merge(var.global_tags, {
      "Name" = "ryan-vpc-bedrock"
    })
}
