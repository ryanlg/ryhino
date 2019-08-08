resource "aws_nat_gateway" "bedrock" {

  allocation_id = "${aws_eip.ngw_bedrock.id}"
  subnet_id     = "${aws_subnet.bedrock_private_1a.id}"

  depends_on = [
    "aws_internet_gateway.bedrock"
  ]

  tags = merge(var.global_tags, {
    "Name" = "ryan-ngw-bedrock"
  })
}
