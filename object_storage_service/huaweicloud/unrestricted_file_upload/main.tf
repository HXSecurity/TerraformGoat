provider "huaweicloud" {
  region     = "cn-north-1"
  access_key = var.huaweicloud_access_key
  secret_key = var.huaweicloud_secret_key
}

resource "huaweicloud_obs_bucket" "create_bucket" {
  bucket        = "hx-cloud-security-${random_string.random_suffix.result}"
  force_destroy = true
  acl           = "public-read-write"
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
