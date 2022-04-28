# Author: UzJu
# TIME: 2022-4-19
output "TenCentCloud_Cos_Name" {
  description = "Cos Name"
  value       = "${tencentcloud_cos_bucket.create_bucket.bucket}.cos.${var.TenCentCloud_Cos_Region}.myqcloud.com"
}

output "TenCentCloud_Cos_Region" {
  description = "Cos Region"
  value       = var.TenCentCloud_Cos_Region
}


