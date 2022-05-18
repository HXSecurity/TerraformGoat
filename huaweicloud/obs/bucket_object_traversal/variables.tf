variable "huaweicloud_access_key" {
  type        = string
  description = "Set HuaweiCloud access key."
  sensitive   = true
  nullable    = false
}

variable "huaweicloud_secret_key" {
  type        = string
  description = "Set HuaweiCloud secret key."
  sensitive   = true
  nullable    = false
}