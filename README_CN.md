
# Terraform Goat

[English](./README.md) | 中文

Terraform Goat 是一个支持多云的云场景漏洞靶场搭建工具，目前支持阿里云、腾讯云、华为云、Amazon Web Services、Google
Cloud Platform、Microsoft Azure 六个云厂商的云场景漏洞搭建。

## 目前所支持的靶场环境

|序号| 云服务类型 | 云厂商 | 漏洞环境 |
| :----:| :----:| :---: | :----: |
| 1 |对象存储|腾讯云|[Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/tencentcloud/bucket_object_traversal)|
| 2 |对象存储|腾讯云|[任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/tencentcloud/unrestricted_file_upload)|
|3| 对象存储 | 阿里云 | [Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/bucket_object_traversal) |
|4| 对象存储 | 阿里云 | [Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/object_acl_writable) |
|5| 对象存储 | 阿里云 | [特殊的 Bucket 策略](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/special_bucket_policy) |
|6| 对象存储 | 阿里云 | [任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aliyun/unrestricted_file_upload) |
| 7 | 对象存储 | 华为云 | [Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/object_acl_writable) |
| 8 |对象存储|华为云|[特殊的 Bucket 策略](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/special_bucket_policy)|
| 9 |对象存储|华为云|[任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/unrestricted_file_upload)|
| 10 |对象存储|华为云|[Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/huaweicloud/bucket_object_traversal)|
| 11 |对象存储|Amazon Web Services|[Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/bucket_object_traversal)|
| 12 |对象存储|Amazon Web Services|[特殊的 Bucket 策略](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/special_bucket_policy)|
| 13 |对象存储|Amazon Web Services|[任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/unrestricted_file_upload)|
| 14 |对象存储|Amazon Web Services|[Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/aws/object_acl_writable)|
| 15 |对象存储|Google Cloud Platform|[Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/bucket_object_traversal)|
| 16 |对象存储|Google Cloud Platform|[Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/object_acl_writable)|
| 17 |对象存储|Google Cloud Platform|[Bucket ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/bucket_acl_writable)|
| 18 |对象存储|Google Cloud Platform|[任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/gcp/unrestricted_file_upload)|
| 19 |对象存储|Microsoft Azure|[Blob 公开访问](https://github.com/HXSecurity/TerraformGoat/tree/main/object_storage_service/azure/blob_public_access/)|
|20| 弹性计算服务 | Amazon Web Services | [EC2 SSRF 漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/elastic_computing_service/aws/ec2_ssrf) |

## 安装

Terraform Goat 使用 Dockerfile 构建，因此需要先安装 Docker 环境，Docker 安装方法可以参考：[https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

```shell
git clone https://github.com/HXSecurity/TerraformGoat.git
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
