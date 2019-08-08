resource "aws_subnet" "ryanl_subnet_bedrock_private_1a" {

  vpc_id            = "${aws_vpc.ryanl_vpc_bedrock.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-subnet-bedrock-private-1a"
  })
}

resource "aws_subnet" "ryanl_subnet_bedrock_private_1b" {

  vpc_id            = "${aws_vpc.ryanl_vpc_bedrock.id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-subnet-bedrock-private-1b"
  })
}

resource "aws_subnet" "ryanl_subnet_bedrock_public_1a" {

  vpc_id            = "${aws_vpc.ryanl_vpc_bedrock.id}"
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1a"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-subnet-bedrock-public-1a"
  })
}

resource "aws_subnet" "ryanl_subnet_bedrock_public_1b" {

  vpc_id            = "${aws_vpc.ryanl_vpc_bedrock.id}"
  cidr_block        = "10.0.102.0/24"
  availability_zone = "us-east-1b"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-subnet-bedrock-public-1b"
  })
}
