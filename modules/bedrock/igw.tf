resource "aws_internet_gateway" "bedrock" {
  vpc_id = "${aws_vpc.bedrock.id}"

  tags = merge(var.global_tags, {
    "Name" = "ryan-igw-bedrock"
  })
}
