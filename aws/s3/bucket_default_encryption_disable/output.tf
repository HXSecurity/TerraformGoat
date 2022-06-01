output "aws_s3_bucket_name" {
  value       = aws_s3_bucket.huoxian_bucket.bucket
  description = "This is the bucket name of AWS S3 Service."
}