variable "tencentcloud_secret_id" {
  type        = string
  description = "Set Tencent Cloud secret id."
  sensitive   = true
  nullable    = false
}

variable "tencentcloud_secret_key" {
  type        = string
  description = "Set Tencent Cloud secret key."
  sensitive   = true
  nullable    = false
}