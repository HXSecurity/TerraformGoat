output "aws_s3_bucket_url" {
  value       = "https://${aws_s3_bucket.huoxian_bucket.bucket}.s3.us-east-1.amazonaws.com"
  description = "This is the bucket url of AWS S3 Service."
}