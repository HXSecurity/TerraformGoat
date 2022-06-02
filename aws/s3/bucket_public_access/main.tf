provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "huoxian_bucket" {
  force_destroy = true
  bucket        = "houxian-${random_string.random_suffix.result}"
}

resource "aws_s3_bucket_acl" "huoxian_bucket_acl" {
  bucket = aws_s3_bucket.huoxian_bucket.id
  access_control_policy {
    grant {
      grantee {
        type = "CanonicalUser"
        id   = data.aws_canonical_user_id.current.id
      }
      permission = "FULL_CONTROL"
    }
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ"
    }
    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

data "aws_canonical_user_id" "current" {}