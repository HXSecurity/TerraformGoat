output "aliyuncloud_oss_info" {
  description = "Bucket URL"
  value       = "${alicloud_oss_bucket.Create_Bucket.bucket}.oss-cn-beijing.aliyuncs.com"
}