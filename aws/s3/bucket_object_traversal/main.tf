provider "aws" {
  region = "us-east-1"
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
	"Id": "Policy1650428243041",
	"Statement": [
		{
			"Sid": "Stmt1650428241699",
			"Effect": "Allow",
			"Principal": "*",
			      "Action": [
                        "s3:GetObject",
                        "s3:PutObject"
                            ],
			"Resource": [
				"arn:aws:s3:::${aws_s3_bucket.CreateBucket.id}",
                "arn:aws:s3:::${aws_s3_bucket.CreateBucket.id}/*"
			]
		}
	]
}

EOF
}

resource "aws_s3_object" "PutObject_Flag" {
  bucket = aws_s3_bucket.CreateBucket.id
  key    = "flag.txt"
  source = "./flag.txt"
  acl    = "public-read-write"
}


resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}
