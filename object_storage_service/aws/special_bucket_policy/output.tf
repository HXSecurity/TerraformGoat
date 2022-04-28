output "AwsCloud_BucketName" {
  description = "S3 Bucket Name"
  value       = "${aws_s3_bucket.CreateBucket.bucket}.s3.${var.Aws_S3_Region}.amazonaws.com"

}

output "AwsCloud_Region" {
  description = "S3 Region"
  value       = var.Aws_S3_Region
}
