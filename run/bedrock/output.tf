output "ryanl_vpc_bedrock_id" {

  value = module.ryanl_bedrock.ryanl_vpc_bedrock.id
}

output "ec2_jumper_id" {
  
  value = module.ryanl_bedrock.ec2_jumper_id
}
