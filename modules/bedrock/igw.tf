resource "aws_internet_gateway" "ryanl_igw_bedrock" {
  vpc_id = "${aws_vpc.ryanl_vpc_bedrock.id}"

  tags = merge(var.global_tags, {
    "Name" = "ryan-igw-bedrock"
  })
}
