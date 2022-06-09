resource "tencentcloud_instance" "instance" {
  instance_name     = "huocorp_terraform_goat_instance"
  availability_zone = "ap-guangzhou-7"
  image_id          = "img-pi0ii46r"
  instance_type     = data.tencentcloud_instance_types.instance_types.instance_types.0.instance_type
  data_disks {
    data_disk_type = "CLOUD_PREMIUM"
    data_disk_size = 50
    encrypt        = false
  }
}

data "tencentcloud_instance_types" "instance_types" {
  cpu_core_count = 1
  memory_size    = 1
}