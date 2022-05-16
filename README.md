# TerraformGoat

[![License: Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-blue)](https://github.com/HuoCorp/TerraformGoat/blob/main/LICENSE) [![GitHub release](https://img.shields.io/github/release/HuoCorp/TerraformGoat.svg)](https://github.com/HuoCorp/TerraformGoat/releases) [![Github Stars](https://img.shields.io/github/stars/HuoCorp/TerraformGoat)](https://github.com/HuoCorp/TerraformGoat/stargazers) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/HuoCorp/TerraformGoat/pulls) [![tweet](https://img.shields.io/twitter/url?url=https://github.com/HuoCorp/TerraformGoat)](https://twitter.com/intent/tweet/?text=TerraformGoat%20is%20HuoCorp%20research%20lab's%20%22Vulnerable%20by%20Design%22%20multi%20cloud%20deployment%20tool.%20Check%20it%20out%20https%3A%2F%2Fgithub.com%2FHuoCorp%2FTerraformGoat%0A%23TerraformGoat%20%23Terraform%20%23Cloud%20%23Security%20%23cloudsecurity)

English | [中文](./README_CN.md)

TerraformGoat is HuoCorp research lab's "Vulnerable by Design" multi cloud deployment tool.

Currently supported cloud vendors include Alibaba Cloud, Tencent Cloud, Huawei Cloud, Amazon Web Services, Google Cloud Platform, Microsoft Azure.

## :dart: Scenarios

|  ID  | Cloud Service Company  |  Types Of Cloud Services  |                    Vulnerable Environment                    |
| :--: | :--------------------: | :-----------------------: | :----------------------------------------------------------: |
|  1   |     Tencent Cloud      |      Object Storage       | [Bucket ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/object_storage_service/bucket_acl_writable) |
|  2   |     Tencent Cloud      |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/object_storage_service/unrestricted_file_upload) |
|  3  |     Tencent Cloud      |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/object_storage_service/bucket_object_traversal) |
|  4  |         Tencent Cloud         |   Elastic Computing Service   | [CVM SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/tencentcloud/elastic_computing_service/cvm_ssrf) |
|  5  |     Alibaba Cloud      |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/object_acl_writable) |
|  6  |     Alibaba Cloud      |      Object Storage       | [Special Bucket Policy](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/special_bucket_policy) |
|  7  |     Alibaba Cloud      |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/bucket_object_traversal) |
|  8  |     Alibaba Cloud      |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/object_storage_service/unrestricted_file_upload) |
|  9  |     Alibaba Cloud      | Elastic Computing Service | [ECS SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/elastic_computing_service/ecs_ssrf) |
|  10  |      Huawei Cloud      |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/object_acl_writable) |
|  11  |      Huawei Cloud      |      Object Storage       | [Special Bucket Policy](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/special_bucket_policy) |
|  12  |      Huawei Cloud      |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/unrestricted_file_upload) |
|  13  |      Huawei Cloud      |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/object_storage_service/bucket_object_traversal) |
|  14  |     Huawei Cloud      | Elastic Computing Service | [ECS SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/huaweicloud/elastic_computing_service/ecs_ssrf) |
|  15  |  Amazon  Web Services  |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/object_acl_writable) |
|  16  |  Amazon  Web Services  |      Object Storage       | [Bucket ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/bucket_acl_writable) |
|  17  |  Amazon  Web Services  |      Object Storage       | [Special Bucket Policy](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/special_bucket_policy) |
|  18  |  Amazon  Web Services  |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/bucket_object_traversal) |
|  19  |  Amazon  Web Services  |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/object_storage_service/unrestricted_file_upload) |
|  20  |  Amazon  Web Services  | Elastic Computing Service | [EC2 SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/elastic_computing_service/ec2_ssrf) |
|  21  |  Amazon  Web Services  | Elastic Computing Service | [Console Takeover](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/elastic_computing_service/console_takeover) |
|  22  |  Amazon  Web Services  | Identity and Access Management | [IAM Privilege Escalation](https://github.com/HuoCorp/TerraformGoat/tree/main/aws/identity_and_access_management/privilege_escalation) |
|  23  | Google  Cloud Platform |      Object Storage       | [Object ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/object_acl_writable) |
|  24  | Google  Cloud Platform |      Object Storage       | [Bucket ACL Writable](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/bucket_acl_writable) |
|  25  | Google  Cloud Platform |      Object Storage       | [Bucket Object Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/bucket_object_traversal) |
|  26  | Google  Cloud Platform |      Object Storage       | [Unrestricted File Upload](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/object_storage_service/unrestricted_file_upload) |
|  27  |  Google  Cloud Platform  | Elastic Computing Service | [VM Command Execution](https://github.com/HuoCorp/TerraformGoat/tree/main/gcp/elastic_computing_service/vm_command_execution) |
|  28  |    Microsoft  Azure    |      Object Storage       | [Blob  Public Access](https://github.com/HuoCorp/TerraformGoat/tree/main/azure/object_storage_service/blob_public_access/) |
|  29  |    Microsoft  Azure    |      Object Storage       | [Container Blob Traversal](https://github.com/HuoCorp/TerraformGoat/tree/main/azure/object_storage_service/container_blob_traversal/) |
|  30  |  Microsoft  Azure  | Elastic Computing Service | [VM Command Execution](https://github.com/HuoCorp/TerraformGoat/tree/main/azure/elastic_computing_service/vm_command_execution) |

## :dizzy: Install

TerraformGoat is built using Dockerfile, so you need to install the Docker environment first. For the Docker installation method, please refer to: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

```shell
git clone https://github.com/HuoCorp/TerraformGoat.git
cd TerraformGoat
docker build -t terraformgoat:v0.0.2 .
```

![img](./images/1652250379.png)

After docker build is complete, start and enter the container

```shell
docker run -itd --name terraformgoat terraformgoat:v0.0.2
docker exec -it terraformgoat /bin/bash
```

When entering the container, you need to select the cloud service to run

![img](./images/1652250438.png)

After selecting the cloud service you want to use, the relevant dependencies will be installed. After the relevant dependencies are installed, you can use TerraformGoat.

Using the build of the [Alibaba Cloud ECS SSRF](https://github.com/HuoCorp/TerraformGoat/tree/main/aliyun/elastic_computing_service/ecs_ssrf) vulnerability scenario as a demo:

[![asciicast](https://asciinema.org/a/493554.svg)](https://asciinema.org/a/493554)

## :rocket: Uninstall

```shell
docker stop terraformgoat
docker rm terraformgoat
docker rmi terraformgoat:v0.0.2
```

## ⚠️ Notice

1. The README of each vulnerable environment is executed within the TerraformGoat container environment, so the TerraformGoat container environment needs to be deployed first.
2. Due to the horizontal risk of intranet horizontal on the cloud in some scenarios, it is strongly recommended that users use their own test accounts to configure the scenarios, avoid using the cloud account of the production environment, and install TerraformGoat using Dockerfile to isolate the user's local cloud vendor token and the test account token.
3. TerraformGoat is used for educational purposes only, It is not allowed to use it for illegal and criminal purposes, any consequences arising from TerraformGoat are the responsibility of the person using it, and not the HuoCorp organization.

## :confetti_ball: Contributing

Contributions are welcomed and greatly appreciated. Further reading — [CONTRIBUTING.md](https://github.com/HuoCorp/TerraformGoat/blob/main/CONTRIBUTING.md) for details on contribution workflow.

## 🪪 License

TerraformGoat is under the Apache 2.0 license. See the [LICENSE](https://github.com/HuoCorp/TerraformGoat/blob/main/LICENSE) file for details.

## :crystal_ball: Stats

![Alt](https://repobeats.axiom.co/api/embed/7b7a9507cda2a2e4ec4303668dfc3e3f15ff29d2.svg "Repobeats analytics image")
