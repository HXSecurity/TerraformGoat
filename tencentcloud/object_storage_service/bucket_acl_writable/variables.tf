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

variable "tencentcloud_app_id" {
  type        = string
  description = "Set Tencent Cloud APP ID."
  sensitive   = true
  nullable    = false
}

variable "tencentcloud_account_id" {
  type        = string
  description = "Set Tencent Cloud Account ID."
  sensitive   = true
  nullable    = false
}