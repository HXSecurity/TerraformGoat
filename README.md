
# Terraform Goat

English | [中文](./README_CN.md)

Terraform Goat is HuoXian research team' "Vulnerable by Design" multi cloud deployment tool.

Currently supported cloud vendors include Alibaba Cloud, Tencent Cloud, Huawei Cloud, Amazon Web Services, Google Cloud Platform, Microsoft Azure.

## Currently Supported Vulnerability Environments

|  ID  |  Types Of Cloud Services  | Cloud Service Company |                    Vulnerable Environment                    |
| :--: | :-----------------------: | :-------------------: | :----------------------------------------------------------: |
|  1   |   Object Storage   |   Tencent Cloud | [Bucket Object Traversal](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/tencentcloud/bucket_object_traversal) |
|  2   |   Object Storage   |   Tencent Cloud | [Unrestricted File Upload](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/tencentcloud/unrestricted_file_upload) |
|  3   |   Object Storage   |   Alibaba Cloud | [Bucket Object Traversal](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/bucket_object_traversal) |
|  4   |   Object Storage   | Alibaba Cloud | [Object ACL Writable](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/object_acl_writable) |
|  5   |   Object Storage   |   Alibaba Cloud | [Special Bucket Policy](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/special_bucket_policy) |
|  6   |   Object Storage   |   Alibaba Cloud | [Unrestricted File Upload](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/unrestricted_file_upload) |
|  7   |   Object Storage   |    Huawei Cloud | [Object ACL Writable](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/object_acl_writable) |
|  8   |   Object Storage   |    Huawei Cloud | [Special Bucket Policy](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/special_bucket_policy) |
|  9   |   Object Storage   |    Huawei Cloud | [Unrestricted File Upload](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/unrestricted_file_upload) |
|  10  |   Object Storage   |    Huawei Cloud | [Bucket Object Traversal](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/bucket_object_traversal) |
|  11  |   Object Storage   |  Amazon Web Services  | [Bucket Object Traversal](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/bucket_object_traversal) |
|  12  |   Object Storage   |  Amazon Web Services  | [Special Bucket Policy](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/special_bucket_policy) |
|  13  |   Object Storage   |  Amazon Web Services  | [Unrestricted File Upload](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/unrestricted_file_upload) |
|  14  |   Object Storage   |  Amazon Web Services  | [Object ACL Writable](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/object_acl_writable) |
|  15  |   Object Storage   | Google Cloud Platform | [Bucket Object Traversal](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/bucket_object_traversal) |
|  16  |   Object Storage   | Google Cloud Platform | [Object ACL Writable](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/object_acl_writable) |
|  17  |   Object Storage   | Google Cloud Platform | [Bucket ACL Writable](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/bucket_acl_writable) |
|  18  |   Object Storage   | Google Cloud Platform | [Unrestricted File Upload](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/unrestricted_file_upload) |
|  19  |   Object Storage   |    Microsoft Azure    | [Blob Public Access](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/azure/blob_public_access/) |
|  20  | Elastic Computing Service |  Amazon Web Services  | [EC2 SSRF](https://github.com/HXSecurity/TerraformGoat/tree/main/elastic_computing_service/aws/ec2_ssrf) |

## Install

Terraform Goat is built using Dockerfile, so you need to install the Docker environment first. For the Docker installation method, please refer to: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

```shell
git clone https://github.com/HXSecurity/TerraformGoat.git
cd terraformgoat
docker build -t terraformgoat:v0.1 .
```

![img](./images/1651136182.png)

After docker build is complete, start and enter the container

```shell
docker run -itd --name terraformgoat terraformgoat:v0.1
docker exec -it terraformgoat /bin/bash
```

When entering the container, you need to select the cloud service to run

![img](./images/1651136346.png)

After selecting the cloud service you want to use, the relevant dependencies will be installed. After the relevant dependencies are installed, you can use terraformgoat.

## Uninstall

```shell
docker stop terraformgoat
docker rm terraformgoat
docker rmi terraformgoat:v0.1
```

## Notice

1. The README of each vulnerable environment is executed within the terraformgoat container environment, so the terraformgoat container environment needs to be deployed first.
2. Due to the horizontal risk of intranet horizontal on the cloud in some ranges, it is strongly recommended that users use their own test accounts to configure the ranges, avoid using the cloud account of the production environment, and install Terraform Goat using Dockerfile to isolate the user's local cloud vendor token and the test account token.
