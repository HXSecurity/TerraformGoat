provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ssrf_web" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform_ec2_ssrf_web"
  }
  vpc_security_group_ids      = [aws_security_group.terraform_allow_tls.id]
  associate_public_ip_address = "true"
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
    aws_security_group.terraform_allow_tls
  ]
}

resource "aws_security_group" "terraform_allow_tls" {
  name        = "terraform_allow_tls"
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

  tags = {
    Name = "terraform_allow_tls"
  }
}
