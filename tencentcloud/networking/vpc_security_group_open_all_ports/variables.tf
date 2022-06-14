variable "tencentcloud_secret_id" {
  type        = string
  description = "Set TencentCloud secret id."
  sensitive   = true
  nullable    = false
}

variable "tencentcloud_secret_key" {
  type        = string
  description = "Set TencentCloud secret key."
  sensitive   = true
  nullable    = false
}