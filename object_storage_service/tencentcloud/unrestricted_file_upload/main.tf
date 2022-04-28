# Author: UzJu
# TIME: 2022-4-19
terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = "1.70.2"
    }
  }
}

provider "tencentcloud" {
  secret_id  = var.TenCentCloud_Cos_ID
  secret_key = var.TenCentCloud_Cos_Key
  region     = var.TenCentCloud_Cos_Region
}

resource "tencentcloud_cos_bucket" "create_bucket" {
  bucket = "hxseclab${random_string.random_suffix.result}-${var.TenCentCloud_Cos_APPID}"
  acl    = "public-read-write"
}

resource "tencentcloud_cos_bucket_object" "index" {
  depends_on = [
    tencentcloud_cos_bucket.create_bucket,
  ]
  bucket = tencentcloud_cos_bucket.create_bucket.bucket
  key    = "hx.png"
  source = "./dist/hx.png"
  acl    = "public-read"
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
