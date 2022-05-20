variable "tencentcloud_secret_id" {
  type        = string
  description = "Set TencentCloud access key id."
  sensitive   = true
  nullable    = false
}

variable "tencentcloud_secret_key" {
  type        = string
  description = "Set TencentCloud secret access key."
  sensitive   = true
  nullable    = false
}