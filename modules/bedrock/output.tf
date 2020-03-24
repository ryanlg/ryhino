output "ryanl_vpc_bedrock" {

  value = aws_vpc.bedrock
}

output "ec2_jumper_ips" {

  description = "Jumper's EIPs"

  value = {
    public = aws_eip.ec2_jumper_public.public_ip
    tunnel = aws_eip.ec2_jumper_tunnel.public_ip
  }
}
