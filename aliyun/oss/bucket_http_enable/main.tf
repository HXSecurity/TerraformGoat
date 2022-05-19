provider "alicloud" {
  profile = "default"
  region  = "cn-beijing"
}

resource "alicloud_oss_bucket" "huoxian_terraformgoat_bucket" {
  force_destroy = true
  bucket        = "huoxian-terraformgoat-bucket-${random_string.random_suffix.result}"
  policy        = <<POLICY
{
	"Version": "1",
	"Statement": [{
		"Effect": "Allow",
		"Action": [
			"*"
		],
		"Principal": [
			"*"
		],
		"Resource": [
			"acs:oss:*:*:*"
		],
		"Condition": {
			"Bool": {
        "acs:SecureTransport": [
          "false"
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