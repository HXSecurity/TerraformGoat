
# Terraform Goat

English | [中文](./README_CN.md)

TerraformGoat is HuoCorp research lab' "Vulnerable by Design" multi cloud deployment tool.

Currently supported cloud vendors include Alibaba Cloud, Tencent Cloud, Huawei Cloud, Amazon Web Services, Google Cloud Platform, Microsoft Azure.

## Currently Supported Vulnerability Environments

|  ID  | Cloud Service Company  |  Types Of Cloud Services  |                    Vulnerable Environment                    |
| :--: | :--------------------: | :-----------------------: | :----------------------------------------------------------: |
|  1   |     Tencent Cloud      |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/object_storage_service/bucket_object_traversal) |
|  2   |     Tencent Cloud      |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/object_storage_service/unrestricted_file_upload) |
|  3  |         Tencent Cloud         |   Elastic Computing Service   | [CVM SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/elastic_computing_service/cvm_ssrf) |
|  4  |     Alibaba Cloud      |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/bucket_object_traversal) |
|  5  |     Alibaba Cloud      |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/object_acl_writable) |
|  6  |     Alibaba Cloud      |      Object Storage       | [Special Bucket Policy](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/special_bucket_policy) |
|  7  |     Alibaba Cloud      |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/unrestricted_file_upload) |
|  8  |     Alibaba Cloud      | Elastic Computing Service | [ECS SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/elastic_computing_service/ecs_ssrf) |
|  9  |      Huawei Cloud      |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/object_acl_writable) |
|  10  |      Huawei Cloud      |      Object Storage       | [Special Bucket Policy](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/special_bucket_policy) |
|  11  |      Huawei Cloud      |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/unrestricted_file_upload) |
|  12  |      Huawei Cloud      |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/bucket_object_traversal) |
|  13  |     Huawei Cloud      | Elastic Computing Service | [ECS SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/elastic_computing_service/ecs_ssrf) |
|  14  |  Amazon  Web Services  |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/bucket_object_traversal) |
|  15  |  Amazon  Web Services  |      Object Storage       | [Special Bucket Policy](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/special_bucket_policy) |
|  16  |  Amazon  Web Services  |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/unrestricted_file_upload) |
|  17  |  Amazon  Web Services  |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/object_acl_writable) |
|  18  |  Amazon  Web Services  | Elastic Computing Service | [EC2 SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/elastic_computing_service/ec2_ssrf) |
|  19  | Google  Cloud Platform |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/bucket_object_traversal) |
|  20  | Google  Cloud Platform |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/object_acl_writable) |
|  21  | Google  Cloud Platform |      Object Storage       | [Bucket ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/bucket_acl_writable) |
|  22  | Google  Cloud Platform |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/unrestricted_file_upload) |
|  23  |    Microsoft  Azure    |      Object Storage       | [Blob  Public Access](https://github.com/HuoCorp/TerraformGoat/tree/main/azure/object_storage_service/blob_public_access/) |

## Install

TerraformGoat is built using Dockerfile, so you need to install the Docker environment first. For the Docker installation method, please refer to: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

```shell
git clone https://github.com/HuoCorp/TerraformGoat.git
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

After selecting the cloud service you want to use, the relevant dependencies will be installed. After the relevant dependencies are installed, you can use TerraformGoat.

## Uninstall

```shell
docker stop terraformgoat
docker rm terraformgoat
docker rmi terraformgoat:v0.1
```

## Notice

1. The README of each vulnerable environment is executed within the TerraformGoat container environment, so the TerraformGoat container environment needs to be deployed first.
2. Due to the horizontal risk of intranet horizontal on the cloud in some scenarios, it is strongly recommended that users use their own test accounts to configure the scenarios, avoid using the cloud account of the production environment, and install TerraformGoat using Dockerfile to isolate the user's local cloud vendor token and the test account token.
