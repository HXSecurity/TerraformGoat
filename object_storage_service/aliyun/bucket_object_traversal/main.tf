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
  region  = var.AliyunCloud_Oss_Region
}

resource "alicloud_oss_bucket_object" "UploadObject" {
  bucket       = alicloud_oss_bucket.Create_Bucket.bucket
  acl          = "public-read-write"
  key          = "index.png"
  source       = "./file/index.html"
  content_type = "inline"
}

resource "alicloud_oss_bucket" "Create_Bucket" {
  bucket        = "hx-cloud-security-ctf-${random_string.random_suffix.result}"
  acl           = "public-read-write"
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


# Randomly generate a 5-digit random number
resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
