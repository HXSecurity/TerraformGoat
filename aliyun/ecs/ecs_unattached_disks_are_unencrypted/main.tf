resource "alicloud_ecs_disk" "disk" {
  zone_id   = "cn-beijing-h"
  disk_name = "huocorp-terraform-goat-disk-${random_string.random_suffix.result}"
  size      = "20"
  encrypted = false
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}