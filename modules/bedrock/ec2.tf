data "aws_ami" "sky_ami_ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "sky_ec2_jumper" {
  subnet_id      = aws_subnet.bedrock_public_1a.id

  ami            = data.aws_ami.sky_ami_ubuntu.id
  instance_type  = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.sg_jumper.id
  ]

  key_name = aws_key_pair.ec2_jumper.key_name

  tags = var.global_tags
}
