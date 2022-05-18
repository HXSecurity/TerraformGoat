output "AliyunOssName" {
  description = "Oss Name"
  value       = "${alicloud_oss_bucket.Put_bucket_acl.bucket}.oss-${var.AliyunCloud_Oss_Region}.aliyuncs.com"
}

output "AliyunOssRegion" {
  description = "Oss Region"
  value       = var.AliyunCloud_Oss_Region
}