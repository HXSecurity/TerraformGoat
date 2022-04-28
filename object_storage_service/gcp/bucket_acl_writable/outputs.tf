output "google_storage_bucket_bucket_name" {
  value       = "https://storage.googleapis.com/${google_storage_bucket.bucket.id}"
  description = "This is the bucket name of google storage bucket name."
}