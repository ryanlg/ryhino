data "aws_ami" "ubuntu_bionic_lts" {
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

resource "aws_instance" "jumper" {
  ami            = data.aws_ami.ubuntu_bionic_lts.id
  instance_type  = "t2.micro"

  key_name = aws_key_pair.ec2_jumper.key_name

  disable_api_termination = true

  network_interface {
    network_interface_id = aws_network_interface.jumper_public.id
    device_index = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.jumper_tunnel.id
    device_index = 1
  }

  tags = var.global_tags
}
