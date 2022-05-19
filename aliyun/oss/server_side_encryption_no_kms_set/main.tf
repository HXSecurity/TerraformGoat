provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket" "huoxian_terraformgoat_bucket" {
  acl           = "private"
  force_destroy = true
  bucket        = "huoxian-terraformgoat-bucket-${random_string.random_suffix.result}"

  server_side_encryption_rule {
    sse_algorithm = "AES256"
  }
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
