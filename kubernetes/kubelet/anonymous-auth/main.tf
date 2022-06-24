resource "alicloud_instance" "instance" {
  security_groups            = alicloud_security_group.group.*.id
  instance_type              = data.alicloud_instance_types.types_ds.instance_types.0.id
  image_id                   = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name              = "huocorp_terraform_goat_instance"
  vswitch_id                 = alicloud_vswitch.vswitch.id
  system_disk_size           = 20
  internet_max_bandwidth_out = 100
  password                   = "Huoxian@123" // 虚拟机密码

  provisioner "file" {
    connection {
      type     = "ssh"
      host     = self.public_ip
      user     = "root"
      password = "Huoxian@123"
      timeout  = "1h"
    }

    source      = "resource/kk"
    destination = "/root/kk" // deploy_k8s.sh用来安装k8s
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = self.public_ip
      user     = "root"
      password = "Huoxian@123"
      timeout  = "1h"
    }
    script = "resource/deploy_k8s.sh"
  }

  depends_on = [
    alicloud_security_group.group,
    alicloud_vswitch.vswitch,
  ]
}

resource "alicloud_security_group" "group" {
  name   = "huocorp_terraform_goat_security_group"
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
  port_range        = "1/65535" // 允许访问所有端口
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
  depends_on = [
    alicloud_security_group.group
  ]
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "huocorp_terraform_goat_vpc"
  cidr_block = "172.16.0.0/16"
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

// kubekey安装k8s集群，配置要求至少 2核4g
data "alicloud_instance_types" "types_ds" {
  cpu_core_count = 2
  memory_size    = 4
}
