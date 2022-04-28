# Author: UzJu
# TIME: 2022-4-19
variable "TenCentCloud_Cos_Region" {
  description = "Value of the Name Tag for the TencentCos Region"
  type        = string
  default     = "ap-nanjing"
}

variable "TenCentCloud_Cos_Name" {
  description = "Value of the Name tag for the TenCentCos BucketName"
  type        = string
  default     = "hxseclab"
}

variable "TenCentCloud_Cos_ID" {
  type        = string
  description = "Set TenCentCloud access key id."
  sensitive   = true
  nullable    = false
}

variable "TenCentCloud_Cos_Key" {
  type        = string
  description = "Set TenCentCloud secret access key."
  sensitive   = true
  nullable    = false
}

variable "TenCentCloud_Cos_APPID" {
  type        = string
  description = "Set TenCentCloud User APPID."
  nullable    = false
}