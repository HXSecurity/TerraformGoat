provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "huoxian_terraform_goat_instance" {
  ami                         = "ami-0e472ba40eb589f49"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  iam_instance_profile        = aws_iam_instance_profile.huoxian_terraform_goat_profile.id
  vpc_security_group_ids      = [aws_security_group.huoxian_terraform_goat_security_group.id]
  user_data                   = <<EOF
#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install apache2
sudo apt-get -y install php
sudo apt-get -y install php-curl
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
sudo /etc/init.d/apache2 restart
cd /var/www/html
sudo apt-get -y install wget
sudo wget https://huocorp-oss.oss-cn-beijing.aliyuncs.com/terraform-goat-dependency-files/ssrf-lab.zip
sudo apt-get -y install unzip
sudo unzip ssrf-lab.zip
sudo mv ./ssrf-lab/static/flag69152201.txt /
EOF
  depends_on = [
    aws_security_group.huoxian_terraform_goat_security_group,
    aws_iam_instance_profile.huoxian_terraform_goat_profile
  ]
}

resource "aws_security_group" "huoxian_terraform_goat_security_group" {
  name        = "huoxian_terraform_goat_security_group"
  description = "Allow TLS inbound traffic"
  ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
}

resource "aws_iam_instance_profile" "huoxian_terraform_goat_profile" {
  name       = "huoxian_terraform_goat_profile"
  role       = aws_iam_role.huoxian_terraform_goat_role.name
  depends_on = [aws_iam_role.huoxian_terraform_goat_role]
}

resource "aws_iam_role" "huoxian_terraform_goat_role" {
  name = "huoxian_terraform_goat_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name = "huoxian_terraform_goat_inline_policy"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = "*"
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }
}