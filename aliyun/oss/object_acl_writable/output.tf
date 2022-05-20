output "aliyun_oss_name" {
  description = "OSS Name"
  value       = "${alicloud_oss_bucket.Put_bucket_acl.bucket}.oss-cn-beijing.aliyuncs.com"
}