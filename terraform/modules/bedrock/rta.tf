resource "aws_route_table_association" "bedrock_public_1a" {

  subnet_id      = aws_subnet.bedrock_public_1a.id
  route_table_id = aws_route_table.bedrock_public_1a.id
}

resource "aws_route_table_association" "bedrock_public_1a_tunnel" {

  subnet_id      = aws_subnet.bedrock_public_1a_jumper.id
  route_table_id = aws_route_table.bedrock_public_1a.id
}

resource "aws_route_table_association" "bedrock_public_1b" {

  subnet_id      = aws_subnet.bedrock_public_1b.id
  route_table_id = aws_route_table.bedrock_public_1b.id
}
