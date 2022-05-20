provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket_object" "flag" {
  bucket = alicloud_oss_bucket.Put_bucket_acl.bucket
  key    = "flag.txt"
  source = "./flag.txt"
}

resource "alicloud_oss_bucket" "Put_bucket_acl" {
  acl           = "private"
  force_destroy = true
  bucket        = "hx-cloud-security-${random_string.random_suffix.result}"
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

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
