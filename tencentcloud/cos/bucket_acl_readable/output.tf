output "Tencent_Cloud_COS_bucket_name" {
  value       = "https://${tencentcloud_cos_bucket.huoxian_cos_bucket.cos_bucket_url}/?acl"
  description = "This is the bucket name of Tencent Cloud COS."
}