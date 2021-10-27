resource "aws_subnet" "bedrock_public_1a" {

  vpc_id            = aws_vpc.bedrock.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "us-east-1a"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-subnet-bedrock-public-1a"
  })
}

// For OpenVPN on Jumper
resource "aws_subnet" "bedrock_public_1a_jumper" {

  vpc_id            = aws_vpc.bedrock.id
  cidr_block        = "10.0.103.0/24"
  availability_zone = "us-east-1a"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-subnet-bedrock-public-1a-jumper"
  })
}

resource "aws_subnet" "bedrock_public_1b" {

  vpc_id            = aws_vpc.bedrock.id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "us-east-1b"

  tags = merge(var.global_tags, {
    "Name" = "ryanl-subnet-bedrock-public-1b"
  })
}
