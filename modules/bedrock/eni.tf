resource "aws_network_interface" "jumper_openvpn" {
  subnet_id       = aws_subnet.bedrock_public_1a_jumper.id
  private_ips     = ["10.0.103.20"]
  security_groups = [aws_security_group.sg_jumper.id]

  attachment {
    instance     = aws_instance.sky_ec2_jumper.id
    device_index = 1
  }
}
