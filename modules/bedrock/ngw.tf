resource "aws_nat_gateway" "bedrock_private_1a" {

  allocation_id = "${aws_eip.ngw_bedrock_private_1a.id}"
  subnet_id     = "${aws_subnet.bedrock_private_1a.id}"

  depends_on = [
    "aws_internet_gateway.bedrock"
  ]

  tags = merge(var.global_tags, {
    "Name" = "ryan-ngw-bedrock-private-1a"
  })
}

resource "aws_nat_gateway" "bedrock_private_1b" {

  allocation_id = "${aws_eip.ngw_bedrock_private_1b.id}"
  subnet_id     = "${aws_subnet.bedrock_private_1b.id}"

  depends_on = [
    "aws_internet_gateway.bedrock"
  ]

  tags = merge(var.global_tags, {
    "Name" = "ryan-ngw-bedrock-private-1b"
  })
}
