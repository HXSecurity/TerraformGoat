provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}


resource "alicloud_instance" "instance" {
  availability_zone          = "cn-beijing-b"
  security_groups            = alicloud_security_group.group.*.id
  instance_type              = data.alicloud_instance_types.types_ds.instance_types.0.id
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "huoxian_terraform_test_instance"
  vswitch_id                 = alicloud_vswitch.vswitch.id
  internet_max_bandwidth_out = 100
  user_data                  = <<EOF
#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install apache2
sudo apt-get -y install php
sudo apt-get -y install php-curl
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
sudo /etc/init.d/apache2 restart
cd /var/www/html
sudo apt-get -y install wget
sudo wget https://ghproxy.com/raw.githubusercontent.com/HuoCorp/TerraformGoat/main/aws/elastic_computing_service/ec2_ssrf/ssrf-lab.zip
sudo apt-get -y install unzip
sudo unzip ssrf-lab.zip
sudo mv ./ssrf-lab/static/flag69152201.txt /
EOF
  depends_on = [
    alicloud_security_group.group,
    alicloud_vswitch.vswitch,
  ]
}


resource "alicloud_security_group" "group" {
  name   = "huoxian_terraform_test_security_group"
  vpc_id = alicloud_vpc.vpc.id
  depends_on = [
    alicloud_vpc.vpc
  ]
}


resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "8080/8080"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
  depends_on = [
    alicloud_security_group.group
  ]
}


resource "alicloud_vpc" "vpc" {
  vpc_name   = "huoxian_terraform_test_vpc"
  cidr_block = "172.16.0.0/16"
}


resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = "cn-beijing-b"
  vswitch_name = "huoxian_terraform_test_vswitch"
  depends_on = [
    alicloud_vpc.vpc
  ]
}


data "alicloud_instance_types" "types_ds" {
  cpu_core_count = 1
  memory_size    = 1
}
