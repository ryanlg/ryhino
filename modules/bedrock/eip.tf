resource "aws_eip" "ngw_bedrock_private_1a" {
  vpc = true

  tags = merge(var.global_tags, {
    "Name" = "ryan-eip-ngw-bedrock-private-1a"
  })
}

resource "aws_eip" "ngw_bedrock_private_1b" {
  vpc = true

  tags = merge(var.global_tags, {
    "Name" = "ryan-eip-ngw-bedrock-private-1b"
  })
}
