resource "aws_key_pair" "ec2_jumper" {
  key_name   = "ryanl-key-pair-ec2-jumper"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDESWaxCkFVwDWZlzNgmXKVmIkLPXxnDpGXqt9bu1iW698cKXPbrXUHpufeF2KayhG04NqydiN/AeVvDaa87t3gRuL2qtjYyCskB2Ozg/6mHiKXvVjpaqF9Y8HYP2Ys/tyw6ztReFZaXsFIuDpKXsk6tVm8t+va6XQH3nCnHXWaOiRG0Q7sPjy2dWAirDCy2J3wS3ThHMm+cN9ege+kJsCINSIQzv/4WRQ+r9qYNqjobFB0GGmk6lbaI5kEdrMzHe0JUsO3b4iqwIauQPALa/QBpOmLvwgE84t3K3KF53H41dfXx8+DI0xm5/GNANcdExr0Iu6mg0CYrxlizg/sbeGh jumper@ryanl.io"
}

