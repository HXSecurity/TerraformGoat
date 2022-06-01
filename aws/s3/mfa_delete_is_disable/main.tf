provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "huoxian_bucket" {
  force_destroy = true
  bucket        = "houxian-${random_string.random_suffix.result}"
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.huoxian_bucket.id

  versioning_configuration {
    status     = "Enabled"
    mfa_delete = "Disabled"
  }
}


resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}