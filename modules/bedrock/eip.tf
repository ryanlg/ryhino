resource "aws_eip" "ryanl_eip_ngw_bedrock" {
  vpc = true

  tags = merge(var.global_tags, {
    "Name" = "ryan-eip-ngw-bedrock"
  })
}
