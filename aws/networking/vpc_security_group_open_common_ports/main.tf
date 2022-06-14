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
}

resource "aws_security_group_rule" "open_21_port" {
  type              = "ingress"
  from_port         = 21
  to_port           = 21
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_22_port" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_23_port" {
  type              = "ingress"
  from_port         = 23
  to_port           = 23
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_25_port" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_137_port" {
  type              = "ingress"
  from_port         = 137
  to_port           = 137
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_138_port" {
  type              = "ingress"
  from_port         = 138
  to_port           = 138
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_445_port" {
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_1433_port" {
  type              = "ingress"
  from_port         = 1433
  to_port           = 1433
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_1434_port" {
  type              = "ingress"
  from_port         = 1434
  to_port           = 1434
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_1521_port" {
  type              = "ingress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_1522_port" {
  type              = "ingress"
  from_port         = 1522
  to_port           = 1522
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_2375_port" {
  type              = "ingress"
  from_port         = 2375
  to_port           = 2375
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_2376_port" {
  type              = "ingress"
  from_port         = 2376
  to_port           = 2376
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_3306_port" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_3389_port" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_4505_port" {
  type              = "ingress"
  from_port         = 4505
  to_port           = 4505
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_4506_port" {
  type              = "ingress"
  from_port         = 4506
  to_port           = 4506
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_5432_port" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_5500_port" {
  type              = "ingress"
  from_port         = 5500
  to_port           = 5500
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_5601_port" {
  type              = "ingress"
  from_port         = 5601
  to_port           = 5601
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_5900_port" {
  type              = "ingress"
  from_port         = 5900
  to_port           = 5900
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_6379_port" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_8020_port" {
  type              = "ingress"
  from_port         = 8020
  to_port           = 8020
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_9200_port" {
  type              = "ingress"
  from_port         = 9200
  to_port           = 9200
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_27017_port" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_50070_port" {
  type              = "ingress"
  from_port         = 50070
  to_port           = 50070
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}

resource "aws_security_group_rule" "open_50470_port" {
  type              = "ingress"
  from_port         = 50470
  to_port           = 50470
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  security_group_id = aws_security_group.huocorp_terraform_goat_security_group.id
}