resource "aws_security_group" "sg_jumper" {
  vpc_id      = aws_vpc.bedrock.id

  name        = "ryanl-sky-sg-jumper"
  description = "Security Group for EC2 Jumper"

  ingress {
    description = "Allow SSH from home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["50.93.222.83/32"]
  }

  ingress {
    description = "Allow ping from home"
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["50.93.222.83/32"]
  }

  ingress {
    description = "Allow OpenVPN from home"
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["50.93.222.83/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
