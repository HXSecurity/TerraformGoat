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
  bucket = alicloud_oss_bucket.Put_bucket_acl.bucket
  key    = "flag.txt"
  source = "./dist/flag.txt"
}

# Storage bucket configuration
# The reason why Action is written oss:* here is because it is difficult to list the policies that can only get buckets separately
# Because the policy GetBucketPolicy depends on many other policies, so here it is simply oss:*, which is also true in the real world
resource "alicloud_oss_bucket" "Put_bucket_acl" {
  # Forced deletion on destruction
  acl           = "private"
  force_destroy = true
  bucket        = "hx-cloud-security-ctf-${random_string.random_suffix.result}"
  policy        = <<POLICY
{
	"Version": "1",
	"Statement": [{
		"Effect": "Allow",
		"Action": [
			"oss:GetObjectAcl",
			"oss:PutObjectAcl"
		],
		"Principal": [
			"*"
		],
		"Resource": [
			"acs:oss:*:*:*/*"
		]
	}]
}
            POLICY
}

# Randomly generate a 5-digit random number
resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
