resource "alicloud_instance" "instance" {
  security_groups  = alicloud_security_group.group.*.id
  instance_type    = data.alicloud_instance_types.types_ds.instance_types.0.id
  image_id         = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  vswitch_id       = alicloud_vswitch.vswitch.id
  system_disk_size = 20
  instance_name    = "huocorp_terraform_goat_instance"
  depends_on = [
    alicloud_security_group.group,
    alicloud_vswitch.vswitch
  ]
}

resource "alicloud_security_group" "group" {
  name   = "huocorp_terraform_goat_security_group"
  vpc_id = alicloud_vpc.vpc.id
  depends_on = [
    alicloud_vpc.vpc
  ]
}

resource "alicloud_vswitch" "vswitch" {
  vpc_id       = alicloud_vpc.vpc.id
  cidr_block   = "172.16.0.0/24"
  zone_id      = "cn-beijing-h"
  vswitch_name = "huocorp_terraform_goat_vswitch"
  depends_on = [
    alicloud_vpc.vpc
  ]
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "huocorp_terraform_goat_vpc"
  cidr_block = "172.16.0.0/16"
}

data "alicloud_instance_types" "types_ds" {
  cpu_core_count = 1
  memory_size    = 1
}