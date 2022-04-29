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

# Need the user to write the key here, otherwise you can comment secret_id and secret_key then the local Tencent cloud cli will be used by default to make the call
provider "tencentcloud" {
  secret_id  = var.TenCentCloud_Cos_ID
  secret_key = var.TenCentCloud_Cos_Key
  region     = var.TenCentCloud_Cos_Region
}

# Creating storage buckets
resource "tencentcloud_cos_bucket" "create_bucket" {
  bucket = "${var.TenCentCloud_Cos_Name}${random_string.random_suffix.result}-${var.TenCentCloud_Cos_APPID}"
  acl    = "private"
}

# Uploading files to the storage bucket
resource "tencentcloud_cos_bucket_object" "index" {
  depends_on = [
    tencentcloud_cos_bucket.create_bucket,
  ]
  bucket = tencentcloud_cos_bucket.create_bucket.bucket
  key    = "index.html"
  source = "./file/index.html"
  acl    = "public-read"
}

# Uploading files to the storage bucket
resource "tencentcloud_cos_bucket_object" "Flag" {
  depends_on = [
    tencentcloud_cos_bucket.create_bucket,
  ]
  bucket = tencentcloud_cos_bucket.create_bucket.bucket
  key    = "weflag.txt"
  source = "./file/flag.txt"
  acl    = "public-read"

}

# Write to Storage Bucket Policy
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
                "qcs::cos:${var.TenCentCloud_Cos_Region}:uid/${var.TenCentCloud_Cos_APPID}:${tencentcloud_cos_bucket.create_bucket.bucket}/*"
            ]
        }
    ],
    "version": "2.0"
}
EOF
}

# Randomly generate a 5-digit random number
resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
