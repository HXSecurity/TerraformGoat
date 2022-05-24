provider "tencentcloud" {
  secret_id  = var.tencentcloud_secret_id
  secret_key = var.tencentcloud_secret_key
  region     = "ap-beijing"
}

resource "tencentcloud_cos_bucket" "huoxian_cos_bucket" {
  bucket = "houxian-${local.random_string_result}-${local.tencentcloud_app_id}"
  acl    = "public-read"
}

resource "tencentcloud_cos_bucket_object" "huoxian_cos_object" {
  bucket = tencentcloud_cos_bucket.huoxian_cos_bucket.bucket
  acl    = "public-read"
  key    = "flag"
  source = "./flag"
  depends_on = [
    tencentcloud_cos_bucket.huoxian_cos_bucket
  ]
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

data "tencentcloud_user_info" "foo" {}

locals {
  tencentcloud_account_id = data.tencentcloud_user_info.foo.owner_uin
  tencentcloud_app_id     = data.tencentcloud_user_info.foo.app_id
  random_string_result    = random_string.random_suffix.result
}