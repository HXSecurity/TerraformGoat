terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.163.0"
    }
  }
}

provider "alicloud" {
  profile = "default"
  region  = "cn-hongkong" // https://help.aliyun.com/document_detail/40654.html
}
