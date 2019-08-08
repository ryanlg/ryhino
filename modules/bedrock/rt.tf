resource "aws_default_route_table" "this" {
  default_route_table_id = "${aws_vpc.bedrock.default_route_table_id}"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-rt-default"
  })
}

resource "aws_route_table" "bedrock_private_1a" {
  vpc_id = "${aws_vpc.bedrock.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.bedrock_private_1a.id}"
  }

  tags = merge(var.global_tags, {
    "Name" = "ryanl-rt-bedrock-private-1a"
  })
}

resource "aws_route_table" "bedrock_private_1b" {
  vpc_id = "${aws_vpc.bedrock.id}"

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.bedrock_private_1b.id}"
  }

  tags = merge(var.global_tags, {
    "Name" = "ryanl-rt-bedrock-private-1b"
  })
}

resource "aws_route_table" "bedrock_public_1a" {
  vpc_id = "${aws_vpc.bedrock.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.bedrock.id}"
  }

  tags = merge(var.global_tags, {
    "Name" = "ryanl-rt-bedrock-public-1a"
  })
}

resource "aws_route_table" "bedrock_public_1b" {
  vpc_id = "${aws_vpc.bedrock.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.bedrock.id}"
  }

  tags = merge(var.global_tags, {
    "Name" = "ryanl-rt-bedrock-public-1b"
  })
}
