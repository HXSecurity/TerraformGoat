provider "huaweicloud" {
  region     = "cn-north-4"
  access_key = var.huaweicloud_access_key
  secret_key = var.huaweicloud_secret_key
}

resource "huaweicloud_compute_instance" "web" {
  name               = "huoxian_terraform_goat_instance"
  image_id           = data.huaweicloud_images_image.myimage.id
  flavor_id          = data.huaweicloud_compute_flavors.myflavor.ids[0]
  security_group_ids = [huaweicloud_networking_secgroup.secgroup.id]
  availability_zone  = "cn-north-4a"
  user_data          = <<EOF
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

  network {
    uuid = huaweicloud_vpc_subnet.subnet.id
  }
  depends_on = [
    huaweicloud_networking_secgroup.secgroup,
    huaweicloud_vpc_subnet.subnet
  ]
}

resource "huaweicloud_networking_secgroup" "secgroup" {
  name = "huoxian_terraform_goat_secgroup"
}

resource "huaweicloud_networking_secgroup_rule" "allow" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8080
  port_range_max    = 8080
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_vpc" "vpc" {
  name = "huoxian_terraform_goat_vpc"
  cidr = "10.77.0.0/16"
}

resource "huaweicloud_vpc_subnet" "subnet" {
  name       = "huoxian_terraform_goat_subnet"
  cidr       = "10.77.0.0/24"
  gateway_ip = "10.77.0.1"
  vpc_id     = huaweicloud_vpc.vpc.id
  depends_on = [
    huaweicloud_vpc.vpc
  ]
}

resource "huaweicloud_vpc_eip" "eip" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "huoxian_terraform_goat_eip"
    size        = 8
    share_type  = "PER"
    charge_mode = "traffic"
  }
}

resource "huaweicloud_compute_eip_associate" "associated" {
  public_ip   = huaweicloud_vpc_eip.eip.address
  instance_id = huaweicloud_compute_instance.web.id
  depends_on = [
    huaweicloud_vpc_eip.eip,
    huaweicloud_compute_instance.web
  ]
}

data "huaweicloud_compute_flavors" "myflavor" {
  availability_zone = "cn-north-4a"
  performance_type  = "normal"
  cpu_core_count    = 1
  memory_size       = 1
}

data "huaweicloud_images_image" "myimage" {
  name        = "Ubuntu 18.04 server 64bit"
  most_recent = true
}