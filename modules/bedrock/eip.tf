resource "aws_eip" "ngw_bedrock" {
  vpc = true

  tags = merge(var.global_tags, {
    "Name" = "ryan-eip-ngw-bedrock"
  })
}
