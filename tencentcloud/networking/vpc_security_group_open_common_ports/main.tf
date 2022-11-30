resource "tencentcloud_instance" "instance" {
  instance_name     = "huocorp_terraform_goat_instance"
  availability_zone = "ap-guangzhou-7"
  image_id          = "img-pi0ii46r"
  security_groups   = [tencentcloud_security_group.default.id]
  instance_type     = data.tencentcloud_instance_types.instance_types.instance_types.0.instance_type
}

resource "tencentcloud_security_group" "default" {
  name        = "huocorp_terraform_goat_security_group"
  description = "make it accessible for both production and stage ports"
  project_id  = 0
}

resource "tencentcloud_security_group_rule" "ingress_21_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "TCP"
  port_range        = "21"
  policy            = "ACCEPT"
}

resource "tencentcloud_security_group_rule" "ingress_22_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "22"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_23_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "23"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_25_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "25"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_137_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "137"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_138_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "138"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_445_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "445"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_1433_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "1433"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_1434_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "1434"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_1521_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "1521"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_1522_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "1522"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_2375_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "2375"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_2376_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "2376"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_3306_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "3306"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_3389_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "3389"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_4505_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "4505"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_4506_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "4506"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_5432_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "5432"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_5500_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "5500"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_5601_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "5601"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_5900_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "5900"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_6379_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "6379"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_8020_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "8020"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_9200_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "9200"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_27017_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "27017"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_50070_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "50070"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ingress_50470_port" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "50470"
  policy            = "accept"
}

data "tencentcloud_instance_types" "instance_types" {
  filter {
    name   = "instance-family"
    values = ["S6"]
  }
  cpu_core_count = 2
  memory_size    = 2
}