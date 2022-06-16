resource "tencentcloud_cbs_storage" "storage" {
  storage_name      = "huocorp_terraforgoat_storage"
  storage_type      = "CLOUD_PREMIUM"
  storage_size      = 10
  availability_zone = "ap-guangzhou-3"
  project_id        = 0
  encrypt           = false
}