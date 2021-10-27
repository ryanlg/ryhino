resource "aws_security_group" "jumper_public" {
  vpc_id      = aws_vpc.bedrock.id

  name        = "ryanl-sky-sg-jumper-public"
  description = "Security Group for Jumper"

  ingress {
    description = "Allow SSH from home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["50.93.222.83/32"]
  }

  ingress {
    description = "Allow ping from home"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["50.93.222.83/32"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Minecraft"
    from_port   = 27315
    to_port     = 27315
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Minecraft"
    from_port   = 27315
    to_port     = 27315
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "jumper_tunnel" {
  vpc_id      = aws_vpc.bedrock.id

  name        = "ryanl-sky-sg-jumper-tunnel"
  description = "Security Group for the OpenVPN tunnel on Jumper"

  ingress {
    description = "Allow ping from home"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["50.93.222.83/32"]
  }

  ingress {
    description = "Allow OpenVPN tunnel from home"
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
