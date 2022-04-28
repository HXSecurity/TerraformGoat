output "AliyunCloud_Oss_Info" {
  description = "Bucket URL"
  value       = "${alicloud_oss_bucket.Create_Bucket.bucket}.oss-${var.AliyunCloud_Oss_Region}.aliyuncs.com"
}
