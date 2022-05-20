provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket_object" "UploadObject" {
  bucket = alicloud_oss_bucket.Create_Bucket.bucket
  acl    = "public-read"
  key    = "flag"
  source = "./flag"
}

resource "alicloud_oss_bucket" "Create_Bucket" {
  bucket        = "hx-cloud-security-${random_string.random_suffix.result}"
  acl           = "public-read"
  force_destroy = true
  policy        = <<POLICY
{
	"Version": "1",
	"Statement": [{
		"Effect": "Allow",
		"Action": [
			"oss:GetObject",
			"oss:PutObject",
			"oss:GetObjectAcl",
			"oss:PutObjectAcl",
			"oss:ListObjects",
			"oss:AbortMultipartUpload",
			"oss:ListParts",
			"oss:RestoreObject",
			"oss:GetVodPlaylist",
			"oss:PostVodPlaylist",
			"oss:PublishRtmpStream",
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
		]
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
			"StringLike": {
          		"oss:Prefix": [
					"*"
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
