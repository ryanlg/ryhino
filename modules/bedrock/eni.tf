resource "aws_network_interface" "jumper_public" {
  subnet_id       = aws_subnet.bedrock_public_1a.id
  security_groups = [aws_security_group.jumper_public.id]
}

resource "aws_network_interface" "jumper_tunnel" {
  subnet_id       = aws_subnet.bedrock_public_1a_jumper.id
  security_groups = [aws_security_group.jumper_tunnel.id]

  private_ips     = ["10.0.103.20"]

  source_dest_check = false
}
