terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.163.0"
    }
  }
}

provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket_object" "flag" {
  bucket       = alicloud_oss_bucket.Put_bucket_acl.bucket
  key          = "hx.png"
  source       = "./dist/hx.png"
  content_type = "inline"
  acl          = "public-read-write"
}

# Storage bucket configuration
# The reason why Action is written oss:* here is because it is difficult to list the policies that can only get buckets separately
# Because the policy GetBucketPolicy depends on many other policies, so here it is simply oss:*, which is also true in the real world
resource "alicloud_oss_bucket" "Put_bucket_acl" {
  # Forced deletion on destruction
  acl           = "public-read-write"
  force_destroy = true
  bucket        = "hx-cloud-security-ctf-${random_string.random_suffix.result}"
}

# Randomly generate a 5-digit random number
resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
