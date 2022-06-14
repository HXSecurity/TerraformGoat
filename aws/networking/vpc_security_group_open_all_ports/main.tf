resource "aws_instance" "huocorp_terraform_goat_instance" {
  ami                    = "ami-0e472ba40eb589f49"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.huocorp_terraform_goat_security_group.id]
  depends_on = [
    aws_security_group.huocorp_terraform_goat_security_group
  ]
}

resource "aws_security_group" "huocorp_terraform_goat_security_group" {
  name = "huocorp_terraform_goat_security_group"
  ingress {
    from_port        = 1
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
}