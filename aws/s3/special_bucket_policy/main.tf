terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region = var.Aws_S3_Region
}

resource "aws_s3_bucket" "CreateBucket" {
  force_destroy = true
  bucket        = "hx-sec-test${random_string.random_suffix.result}"

  tags = {
    Name        = "HxCloudLab"
    Environment = "Lab"
  }
}

resource "aws_s3_bucket_acl" "CreateBucketAcl" {
  bucket = aws_s3_bucket.CreateBucket.id
  acl    = "public-read-write"
}

resource "aws_s3_bucket_policy" "CreateBucketPolicy" {
  bucket = aws_s3_bucket.CreateBucket.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "Policy1650890462488",
    "Statement": [
        {
            "Sid": "Stmt1650890461714",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.CreateBucket.id}/*",
            "Condition": {
                "StringLike": {
                    "aws:UserAgent": "HxSecurityLab"
                }
            }
        }
    ]
}
EOF
}

resource "aws_s3_bucket_object" "PutObject" {
  bucket       = aws_s3_bucket.CreateBucket.id
  key          = "index.html"
  source       = "./file/index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "PutObject_Flag" {
  bucket       = aws_s3_bucket.CreateBucket.id
  key          = "weflag.txt"
  source       = "./file/flag.txt"
  content_type = "text/html"
}


resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
