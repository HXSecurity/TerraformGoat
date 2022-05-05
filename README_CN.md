
# Terraform Goat

[English](./README.md) | 中文

Terraform Goat 是一个支持多云的云场景漏洞靶场搭建工具，目前支持阿里云、腾讯云、华为云、Amazon Web Services、Google
Cloud Platform、Microsoft Azure 六个云厂商的云场景漏洞搭建。

## 目前所支持的靶场环境

| 序号 |         云厂商         |  云服务类型  |                           漏洞环境                           |
| :--: | :--------------------: | :----------: | :----------------------------------------------------------: |
|  1   |         腾讯云         |   对象存储   | [Bucket 对象遍历](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/object_storage_service/bucket_object_traversal) |
|  2   |         腾讯云         |   对象存储   | [任意文件上传](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/object_storage_service/unrestricted_file_upload) |
|  3   |         阿里云         |   对象存储   | [Bucket 对象遍历](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/bucket_object_traversal) |
|  4   |         阿里云         |   对象存储   | [Object ACL 可写](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/object_acl_writable) |
|  5   |         阿里云         |   对象存储   | [特殊的 Bucket 策略](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/special_bucket_policy) |
|  6   |         阿里云         |   对象存储   | [任意文件上传](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/unrestricted_file_upload) |
|  7   |         华为云         |   对象存储   | [Object ACL 可写](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/object_acl_writable) |
|  8   |         华为云         |   对象存储   | [特殊的 Bucket 策略](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/special_bucket_policy) |
|  9   |         华为云         |   对象存储   | [任意文件上传](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/unrestricted_file_upload) |
|  10  |         华为云         |   对象存储   | [Bucket 对象遍历](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/bucket_object_traversal) |
|  11  |  Amazon  Web Services  |   对象存储   | [Bucket 对象遍历](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/bucket_object_traversal) |
|  12  |  Amazon  Web Services  |   对象存储   | [特殊的 Bucket 策略](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/special_bucket_policy) |
|  13  |  Amazon  Web Services  |   对象存储   | [任意文件上传](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/unrestricted_file_upload) |
|  14  |  Amazon  Web Services  |   对象存储   | [Object ACL 可写](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/object_acl_writable) |
|  15  |  Amazon  Web Services  | 弹性计算服务 | [EC2 SSRF 漏洞环境](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/elastic_computing_service/ec2_ssrf) |
|  16  | Google  Cloud Platform |   对象存储   | [Bucket 对象遍历](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/bucket_object_traversal) |
|  17  | Google  Cloud Platform |   对象存储   | [Object ACL 可写](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/object_acl_writable) |
|  18  | Google  Cloud Platform |   对象存储   | [Bucket ACL 可写](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/bucket_acl_writable) |
|  19  | Google  Cloud Platform |   对象存储   | [任意文件上传](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/unrestricted_file_upload) |
|  20  |    Microsoft  Azure    |   对象存储   | [Blob 公开访问](https://github.com/HuoCorp/TerraformGoat/tree/main/azure/object_storage_service/blob_public_access/) |

## 安装

Terraform Goat 使用 Dockerfile 构建，因此需要先安装 Docker 环境，Docker 安装方法可以参考：[https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

```shell
git clone https://github.com/HuoCorp/TerraformGoat.git
cd terraformgoat
docker build -t terraformgoat:v0.1 .
```

![img](./images/1651136182.png)

docker build 完成后，启动并进入容器

```shell
docker run -itd --name terraformgoat terraformgoat:v0.1
docker exec -it terraformgoat /bin/bash
```

在进入容器时需要选择要使用到的云服务

![img](./images/1651136346.png)

选择你要用的云服务后会安装相关依赖，等相关依赖安装完后，就可以使用 terraformgoat 了

## 卸载

```shell
docker stop terraformgoat
docker rm terraformgoat
docker rmi terraformgoat:v0.1
```

## 注意

1. 在每个漏洞环境的 README 中都是在 terraformgoat 容器环境内执行的，因此需要先部署 terraformgoat 容器环境。
2. 由于部分靶场存在云上内网横向的风险，因此强烈建议用户使用自己的测试账号配置靶场，避免使用生产环境的云账号，使用 Dockerfile 安装 Terraform Goat 也是为了将用户本地的云厂商令牌和测试账号的令牌进行隔离。
