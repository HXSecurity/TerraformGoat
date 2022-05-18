provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket" "huoxian_terraformgoat_bucket" {
  acl           = "public-read"
  force_destroy = true
  bucket        = "huoxian-terraformgoat-bucket-${random_string.random_suffix.result}"
}

resource "alicloud_oss_bucket_object" "huoxian_terraformgoat_object" {
  bucket     = alicloud_oss_bucket.huoxian_terraformgoat_bucket.bucket
  acl        = "public-read"
  key        = "flag"
  source     = "./flag"
  depends_on = [alicloud_oss_bucket.huoxian_terraformgoat_bucket]
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
