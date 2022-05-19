output "aliyun_oss_url" {
  description = "aliyun oss url"
  value       = "https://${alicloud_oss_bucket.huoxian_terraformgoat_bucket.bucket}.oss-cn-beijing.aliyuncs.com"
}