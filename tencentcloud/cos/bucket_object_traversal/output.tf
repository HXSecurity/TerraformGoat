output "tencentcloud_cos_name" {
  description = "COS Name"
  value       = "${tencentcloud_cos_bucket.create_bucket.bucket}.cos.ap-beijing.myqcloud.com"
}


