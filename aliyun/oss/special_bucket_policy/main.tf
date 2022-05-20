provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket" "Create_Bucket" {
  bucket        = "hx-cloud-security-${random_string.random_suffix.result}"
  acl           = "public-read-write"
  force_destroy = true
  policy        = <<POLICY
{
	"Version": "1",
	"Statement": [{
		"Effect": "Allow",
		"Action": [
			"oss:GetObject",
			"oss:GetObjectAcl",
			"oss:ListObjects",
			"oss:RestoreObject",
			"oss:GetVodPlaylist",
			"oss:ListObjectVersions",
			"oss:GetObjectVersion",
			"oss:GetObjectVersionAcl",
			"oss:RestoreObjectVersion"
		],
		"Principal": [
			"*"
		],
		"Resource": [
			"acs:oss:*:*:*/*"
		],
		"Condition": {
			"StringEquals": {
          		"acs:UserAgent": [
					"test"
				]
			}
		}
	}, {
		"Effect": "Allow",
		"Action": [
			"oss:ListObjects",
			"oss:GetObject"
		],
		"Principal": [
			"*"
		],
		"Resource": [
			"acs:oss:*:*:*"
		],
		"Condition": {
			"StringEquals": {
          		"acs:UserAgent": [
					"HxSecurityLab"
				]
			}
		}
	}]
}
POLICY
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
