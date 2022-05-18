provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket" "huoxian_terraformgoat_bucket" {
  acl           = "private"
  force_destroy = true
  bucket        = "huoxian-terraformgoat-bucket-${random_string.random_suffix.result}"
  policy        = <<POLICY
{
	"Version": "1",
	"Statement": [{
		"Effect": "Allow",
		"Action": [
			"oss:GetBucketPolicy"
		],
		"Principal": [
			"*"
		],
		"Resource": [
			"acs:oss:*:*:*"
		]
	}]
}
POLICY
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
