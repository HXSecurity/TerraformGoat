provider "tencentcloud" {
  secret_id  = var.tencentcloud_secret_id
  secret_key = var.tencentcloud_secret_key
  region     = "ap-beijing"
}

resource "tencentcloud_cos_bucket" "create_bucket" {
  bucket = "hxlab-${random_string.random_suffix.result}-${data.tencentcloud_user_info.foo.app_id}"
  acl    = "public-read-write"
}

resource "tencentcloud_cos_bucket_object" "index" {
  bucket = tencentcloud_cos_bucket.create_bucket.bucket
  key    = "hx.png"
  source = "./dist/hx.png"
  acl    = "public-read"

  depends_on = [
    tencentcloud_cos_bucket.create_bucket,
  ]
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

data "tencentcloud_user_info" "foo" {}