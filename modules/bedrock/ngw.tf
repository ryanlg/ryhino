resource "aws_nat_gateway" "ryanl_ngw_bedrock" {

  allocation_id = "${aws_eip.ryanl_eip_ngw_bedrock.id}"
  subnet_id     = "${aws_subnet.ryanl_subnet_bedrock_private_1a.id}"

  depends_on = [
    "aws_internet_gateway.ryanl_igw_bedrock"
  ]

  tags = merge(var.global_tags, {
    "Name" = "ryan-ngw-bedrock"
  })
}
