// @disabled: Expensive
# resource "aws_eip" "ngw_bedrock_private_1a" {
#   vpc = true

#   tags = merge(var.global_tags, {
#     "Name" = "ryan-eip-ngw-bedrock-private-1a"
#   })
# }

// @disabled: Expensive
# resource "aws_eip" "ngw_bedrock_private_1b" {
#   vpc = true

#   tags = merge(var.global_tags, {
#     "Name" = "ryan-eip-ngw-bedrock-private-1b"
#   })
# }

resource "aws_eip" "eip_ec2_jumper" {
  vpc      = true

  instance = aws_instance.sky_ec2_jumper.id
}
