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

resource "huaweicloud_networking_secgroup_rule" "ssh" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "mysql" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3306
  port_range_max    = 3306
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "full_port" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "windows_Remote_desktop" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3389
  port_range_max    = 3389
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "sqlserver" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1433
  port_range_max    = 1433
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "oracle" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1521
  port_range_max    = 1521
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "redis" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 6379
  port_range_max    = 6379
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "docker_api" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2375
  port_range_max    = 2375
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "docker_api_tls" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2376
  port_range_max    = 2376
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}


resource "huaweicloud_networking_secgroup_rule" "postgresql" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "kibana" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5601
  port_range_max    = 5601
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "mongodb" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 27017
  port_range_max    = 27017
  remote_ip_prefix  = "0.0.0.0/0"
  depends_on = [
    huaweicloud_networking_secgroup.secgroup
  ]
}

resource "huaweicloud_networking_secgroup_rule" "elasticsearch" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9200
  port_range_max    = 9200
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