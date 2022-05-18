output "huaweicloud_obs_bucket_name" {
  value       = huaweicloud_obs_bucket.create_bucket.bucket_domain_name
  description = "This is the bucket name of Huawei Cloud Object Storage Service (OBS)."
}