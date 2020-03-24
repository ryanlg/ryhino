resource "aws_eip" "ec2_jumper_public" {
  vpc      = true

  network_interface = aws_network_interface.jumper_public.id
}

resource "aws_eip" "ec2_jumper_tunnel" {
  vpc      = true

  network_interface = aws_network_interface.jumper_tunnel.id
}
