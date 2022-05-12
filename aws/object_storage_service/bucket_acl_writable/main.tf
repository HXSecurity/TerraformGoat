provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "huoxian_bucket" {
  force_destroy = true
  bucket        = "houxian${random_string.random_suffix.result}"
}

resource "aws_s3_bucket_acl" "huoxian_bucket_acl" {
  bucket     = aws_s3_bucket.huoxian_bucket.id
  depends_on = [aws_s3_bucket.huoxian_bucket]
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
      permission = "READ_ACP"
    }
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "WRITE_ACP"
    }
    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}

resource "aws_s3_object" "huoxian_object" {
  bucket = aws_s3_bucket.huoxian_bucket.id
  acl    = "public-read"
  key    = "flag1650859"
  source = "./flag1650859"
  depends_on = [
    aws_s3_bucket.huoxian_bucket,
  ]
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

data "aws_canonical_user_id" "current" {}