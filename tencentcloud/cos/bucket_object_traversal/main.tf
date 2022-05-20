provider "tencentcloud" {
  secret_id  = var.tencentcloud_secret_id
  secret_key = var.tencentcloud_secret_key
  region     = "ap-beijing"
}

resource "tencentcloud_cos_bucket" "create_bucket" {
  bucket = "hxlab-${local.random_string_result}-${local.tencentcloud_app_id}"
  acl    = "private"
}

resource "tencentcloud_cos_bucket_object" "Flag" {
  bucket = tencentcloud_cos_bucket.create_bucket.bucket
  key    = "weflag.txt"
  source = "./flag.txt"
  acl    = "public-read"
  depends_on = [
    tencentcloud_cos_bucket.create_bucket,
  ]
}

resource "tencentcloud_cos_bucket_policy" "cos_policy" {
  depends_on = [
    tencentcloud_cos_bucket.create_bucket,
  ]
  bucket = tencentcloud_cos_bucket.create_bucket.bucket
  policy = <<EOF
{
    "Statement": [
        {
            "Action": [
                "name/cos:GetBucket",
                "name/cos:GetBucketObjectVersions",
                "name/cos:GetBucketIntelligentTiering",
                "name/cos:HeadBucket",
                "name/cos:ListMultipartUploads",
                "name/cos:ListParts",
                "name/cos:GetObject",
                "name/cos:HeadObject",
                "name/cos:OptionsObject",
                "name/cos:PutObject",
                "name/cos:PostObject",
                "name/cos:DeleteObject",
                "name/cos:InitiateMultipartUpload",
                "name/cos:UploadPart",
                "name/cos:CompleteMultipartUpload",
                "name/cos:AbortMultipartUpload"
            ],
            "Effect": "Allow",
            "Principal": {
                "qcs": [
                    "qcs::cam::anyone:anyone"
                ]
            },
            "Resource": [
                "qcs::cos:ap-beijing:uid/${local.tencentcloud_app_id}:${tencentcloud_cos_bucket.create_bucket.bucket}/*"
            ]
        }
    ],
    "version": "2.0"
}
EOF
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

data "tencentcloud_user_info" "foo" {}

locals {
  tencentcloud_account_id = data.tencentcloud_user_info.foo.owner_uin
  tencentcloud_app_id     = data.tencentcloud_user_info.foo.app_id
  random_string_result    = random_string.random_suffix.result
}