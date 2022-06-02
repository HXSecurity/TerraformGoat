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

variable "vpc_name" {
  default = "vpc-basic"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "subnet_name" {
  default = "subent-basic"
}

variable "subnet_cidr" {
  default = "172.16.10.0/24"
}

variable "subnet_gateway" {
  default = "172.16.10.1"
}

variable "primary_dns" {
  default = "100.125.1.250"
}