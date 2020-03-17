output "ryanl_vpc_bedrock" {

  value = aws_vpc.bedrock
}

output "ec2_jumper_id" {
  
  value = aws_instance.sky_ec2_jumper.id
}
