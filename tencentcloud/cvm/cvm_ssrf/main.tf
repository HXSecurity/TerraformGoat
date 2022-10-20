provider "tencentcloud" {
  secret_id  = var.tencentcloud_secret_id
  secret_key = var.tencentcloud_secret_key
  region     = "ap-beijing"
}

resource "tencentcloud_instance" "web" {
  instance_name              = "huoxian_terraform_goat_instance"
  availability_zone          = "ap-beijing-7"
  image_id                   = "img-pi0ii46r"
  instance_type              = data.tencentcloud_instance_types.instance_types.instance_types.0.instance_type
  allocate_public_ip         = true
  internet_max_bandwidth_out = 50
  security_groups            = [tencentcloud_security_group.default.id]
  user_data_raw              = <<EOF
#!/bin/bash
sudo apt-get -y update
sleep 10s
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
    tencentcloud_security_group_rule.ingress,
    tencentcloud_security_group_rule.egress
  ]
}

resource "tencentcloud_security_group" "default" {
  name        = "huoxian_terraform_goat_security_group"
  description = "make it accessible for both production and stage ports"
  project_id  = 0
}

resource "tencentcloud_security_group_rule" "ingress" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "8080"
  policy            = "accept"
  depends_on = [
    tencentcloud_security_group.default
  ]
}

resource "tencentcloud_security_group_rule" "egress" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "egress"
  cidr_ip           = "0.0.0.0/0"
  policy            = "accept"
  depends_on = [
    tencentcloud_security_group.default
  ]
}

data "tencentcloud_instance_types" "instance_types" {
  filter {
    name   = "instance-family"
    values = ["S6"]
  }
  cpu_core_count = 2
  memory_size    = 2
}
