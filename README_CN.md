# TerraformGoat

[![License: Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-blue)](https://github.com/HXSecurity/TerraformGoat/blob/main/LICENSE) [![GitHub release](https://img.shields.io/github/release/HXSecurity/TerraformGoat.svg)](https://github.com/HXSecurity/TerraformGoat/releases) [![Github Stars](https://img.shields.io/github/stars/HXSecurity/TerraformGoat)](https://github.com/HXSecurity/TerraformGoat/stargazers) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/HXSecurity/TerraformGoat/pulls) [![tweet](https://img.shields.io/twitter/url?url=https://github.com/HXSecurity/TerraformGoat)](https://twitter.com/intent/tweet/?text=TerraformGoat%20is%20HXSecurity%20research%20lab's%20%22Vulnerable%20by%20Design%22%20multi%20cloud%20deployment%20tool.%20Check%20it%20out%20https%3A%2F%2Fgithub.com%2FHXSecurity%2FTerraformGoat%0A%23TerraformGoat%20%23Terraform%20%23Cloud%20%23Security%20%23cloudsecurity)

[English](./README.md) | 中文

TerraformGoat 是一个支持多云的云场景漏洞靶场搭建工具，目前支持阿里云、腾讯云、华为云、Amazon Web Services、Google
Cloud Platform、Microsoft Azure 六个云厂商的云场景漏洞搭建。

## :dart: 目前所支持的场景

| 序号 |        云厂商         |   云服务类型   |                           漏洞环境                           |
| :--: | :-------------------: | :------------: | :----------------------------------------------------------: |
|  1   |        阿里云         |      网络      | [VPC 安全组允许所有端口访问](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/networking/vpc_security_group_open_all_ports) |
|  2   |        阿里云         |      网络      | [VPC 安全组允许常见端口访问](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/networking/vpc_security_group_open_common_ports) |
|  3   |        阿里云         |    对象存储    | [任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/unrestricted_file_upload) |
|  4   |        阿里云         |    对象存储    | [Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/bucket_object_traversal) |
|  5   |        阿里云         |    对象存储    | [Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/object_acl_writable) |
|  6   |        阿里云         |    对象存储    | [Object ACL 可读](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/object_acl_readable) |
|  7   |        阿里云         |    对象存储    | [Bucket 公开访问](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/bucket_public_access) |
|  8   |        阿里云         |    对象存储    | [Object 公开访问](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/object_public_access) |
|  9   |        阿里云         |    对象存储    | [Bucket 策略可读](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/bucket_policy_readable) |
|  10  |        阿里云         |    对象存储    | [Bucket HTTP 开启](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/bucket_http_enable) |
|  11  |        阿里云         |    对象存储    | [特殊的 Bucket 策略](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/special_bucket_policy) |
|  12  |        阿里云         |    对象存储    | [Bucket 日志转存未开启](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/bucket_logging_disable) |
|  13  |        阿里云         |    对象存储    | [Bucket 服务端加密未使用 KMS](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/server_side_encryption_no_kms_set) |
|  14  |        阿里云         |    对象存储    | [Bucket 服务端加密未使用 BYOK](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/server_side_encryption_not_using_BYOK) |
|  15  |        阿里云         |  弹性计算服务  | [ECS SSRF 漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/ecs/ecs_ssrf) |
|  16  |        阿里云         |  弹性计算服务  | [ECS 未连接的磁盘未开启加密](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/ecs/ecs_unattached_disks_are_unencrypted) |
|  17  |        阿里云         |  弹性计算服务  | [ECS 虚拟机的磁盘未开启加密](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/ecs/ecs_virtual_machine_disks_are_unencrypted) |
|  18  |        腾讯云         |      网络      | [VPC 安全组允许所有端口访问](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/networking/vpc_security_group_open_all_ports) |
|  19  |        腾讯云         |      网络      | [VPC 安全组允许常见端口访问](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/networking/vpc_security_group_open_common_ports) |
|  20  |        腾讯云         |    对象存储    | [任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/unrestricted_file_upload) |
|  21  |        腾讯云         |    对象存储    | [Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/bucket_object_traversal) |
|  22  |        腾讯云         |    对象存储    | [Bucket 公开访问](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/bucket_public_access) |
|  23  |        腾讯云         |    对象存储    | [Object 公开访问](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/object_public_access) |
|  24  |        腾讯云         |    对象存储    | [Bucket ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/bucket_acl_writable) |
|  25  |        腾讯云         |    对象存储    | [Bucket ACL 可读](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/bucket_acl_readable) |
|  26  |        腾讯云         |    对象存储    | [服务端加密未开启](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/server_side_encryption_disable) |
|  27  |        腾讯云         |    对象存储    | [Bucket 日志存储未开启](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cos/bucket_logging_disable) |
|  28  |        腾讯云         |  弹性计算服务  | [云硬盘未被使用](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cvm/cbs_storage_are_not_used) |
|  29  |        腾讯云         |  弹性计算服务  | [CVM SSRF 漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cvm/cvm_ssrf) |
|  30  |        腾讯云         |  弹性计算服务  | [CVM 虚拟机的磁盘未开启加密](https://github.com/HXSecurity/TerraformGoat/tree/main/tencentcloud/cvm/cvm_virtual_machine_disks_are_unencrypted) |
|  31  |        华为云         |      网络      | [ECS 不安全的安全组配置](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/networking/cis_unsafe_secgroup) |
|  32  |        华为云         |    对象存储    | [任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/obs/unrestricted_file_upload) |
|  33  |        华为云         |    对象存储    | [Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/obs/object_acl_writable) |
|  34  |        华为云         |    对象存储    | [Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/obs/bucket_object_traversal) |
|  35  |        华为云         |    对象存储    | [特殊的 Bucket 策略](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/obs/special_bucket_policy) |
|  36  |        华为云         |    对象存储    | [错误的 Policy 策略导致任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/obs/policy_of_unrestricted_file_upload) |
|  37  |        华为云         |  弹性计算服务  | [ECS SSRF 漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/ecs/ecs_ssrf) |
|  38  |        华为云         |  关系型数据库  | [RDS Mysql基线检查环境](https://github.com/HXSecurity/TerraformGoat/tree/main/huaweicloud/rds/cis_rds_mysql) |
|  39  |  Amazon Web Services  |      网络      | [VPC 安全组允许所有端口访问](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/networking/vpc_security_group_open_all_ports) |
|  40  |  Amazon Web Services  |      网络      | [VPC 安全组允许常见端口访问](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/networking/vpc_security_group_open_common_ports) |
|  41  |  Amazon Web Services  |    对象存储    | [任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/unrestricted_file_upload) |
|  42  |  Amazon Web Services  |    对象存储    | [Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/object_acl_writable) |
|  43  |  Amazon Web Services  |    对象存储    | [Bucket ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/bucket_acl_writable) |
|  44  |  Amazon Web Services  |    对象存储    | [Bucket ACL 可读](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/bucket_acl_readable) |
|  45  |  Amazon Web Services  |    对象存储    | [Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/bucket_object_traversal) |
|  46  |  Amazon Web Services  |    对象存储    | [特殊的 Bucket 策略](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/special_bucket_policy) |
|  47  |  Amazon Web Services  |    对象存储    | [Bucket 允许 HTTP 访问](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/bucket_allow_http_access) |
|  48  |  Amazon Web Services  |    对象存储    | [Bucket 默认加密未开启](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/bucket_default_encryption_disable) |
|  49  |  Amazon Web Services  |    对象存储    | [Bucket 日志转存未开启](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/bucket_logging_disable) |
|  50  |  Amazon Web Services  |    对象存储    | [Bucket 删除未开启 MFA](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/s3/mfa_delete_is_disable) |
|  51  |  Amazon Web Services  |  弹性计算服务  | [EBS 卷未使用](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/ec2/EBS_volumes_are_not_used) |
|  52  |  Amazon Web Services  |  弹性计算服务  | [EC2 SSRF 漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/ec2/ec2_ssrf) |
|  53  |  Amazon Web Services  |  弹性计算服务  | [控制台接管漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/ec2/console_takeover) |
|  54  |  Amazon Web Services  |  弹性计算服务  | [EBS 卷加密默认未开启](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/ec2/EBS_volumes_encryption_is_disabled) |
|  55  |  Amazon Web Services  |  弹性计算服务  | [EBS 卷快照未开启加密](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/ec2/snapshots_of_EBS_volumes_are_unencrypted) |
|  56  |  Amazon Web Services  | 身份和访问管理 | [IAM 提权环境](https://github.com/HXSecurity/TerraformGoat/tree/main/aws/iam/privilege_escalation) |
|  57  | Google Cloud Platform |    对象存储    | [任意文件上传](https://github.com/HXSecurity/TerraformGoat/tree/main/gcp/cs/unrestricted_file_upload) |
|  58  | Google Cloud Platform |    对象存储    | [Object ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/gcp/cs/object_acl_writable) |
|  59  | Google Cloud Platform |    对象存储    | [Bucket ACL 可写](https://github.com/HXSecurity/TerraformGoat/tree/main/gcp/cs/bucket_acl_writable) |
|  60  | Google Cloud Platform |    对象存储    | [Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/gcp/cs/bucket_object_traversal) |
|  61  | Google Cloud Platform |  弹性计算服务  | [VM 命令执行漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/gcp/vm/vm_command_execution) |
|  62  |    Microsoft Azure    |    对象存储    | [Blob 公开访问](https://github.com/HXSecurity/TerraformGoat/tree/main/azure/blob/blob_public_access/) |
|  63  |    Microsoft Azure    |    对象存储    | [Container Blob 遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/azure/blob/container_blob_traversal/) |
|  64  |    Microsoft Azure    |  弹性计算服务  | [VM 命令执行漏洞环境](https://github.com/HXSecurity/TerraformGoat/tree/main/azure/vm/vm_command_execution) |

## :dizzy: 安装

TerraformGoat 使用 Docker 镜像部署，因此需要 Docker Engine 环境支持，Docker Engine 安装可以参考 [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)

根据你使用到的云服务提供商，选择对应的安装命令。

阿里云

```bash
docker pull registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_aliyun:0.0.7
docker run -itd --name terraformgoat_aliyun_0.0.7 registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_aliyun:0.0.7
docker exec -it terraformgoat_aliyun_0.0.7 /bin/bash
```

腾讯云

```bash
docker pull registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_tencentcloud:0.0.7
docker run -itd --name terraformgoat_tencentcloud_0.0.7 registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_tencentcloud:0.0.7
docker exec -it terraformgoat_tencentcloud_0.0.7 /bin/bash
```

华为云

```bash
docker pull registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_huaweicloud:0.0.7
docker run -itd --name terraformgoat_huaweicloud_0.0.7 registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_huaweicloud:0.0.7
docker exec -it terraformgoat_huaweicloud_0.0.7 /bin/bash
```

Amazon Web Services

```bash
docker pull registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_aws:0.0.7
docker run -itd --name terraformgoat_aws_0.0.7 registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_aws:0.0.7
docker exec -it terraformgoat_aws_0.0.7 /bin/bash
```

Google Cloud Platform

```bash
docker pull registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_gcp:0.0.7
docker run -itd --name terraformgoat_gcp_0.0.7 registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_gcp:0.0.7
docker exec -it terraformgoat_gcp_0.0.7 /bin/bash
```

Microsoft Azure

```bash
docker pull registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_azure:0.0.7
docker run -itd --name terraformgoat_azure_0.0.7 registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_azure:0.0.7
docker exec -it terraformgoat_azure_0.0.7 /bin/bash
```

## :page_facing_up: 演示

进入到容器后，cd 到对应的场景目录，就可以开始部署靶场了，这里以 [阿里云 Bucket 对象遍历](https://github.com/HXSecurity/TerraformGoat/tree/main/aliyun/oss/bucket_object_traversal) 漏洞场景的搭建进行演示：

```bash
docker pull registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_aliyun:0.0.7
docker run -itd --name terraformgoat_aliyun_0.0.7 registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat_aliyun:0.0.7
docker exec -it terraformgoat_aliyun_0.0.7 /bin/bash
```

![img](./images/1663151143.png)

```bash
cd /TerraformGoat/aliyun/oss/bucket_object_traversal/
aliyun configure
terraform init
terraform apply
```

![img](./images/1655118969.png)

提示`Enter a value:`，输入 `yes` 并回车，使用 curl 访问该 bucket，可以看到遍历到的对象。

![img](./images/1655119171.png)

为避免云服务继续产生费用，请在复现完后，及时销毁靶场，销毁靶场命令如下：

```bash
terraform destroy
```

## :rocket: 卸载

如果在容器中，先执行 `exit` 命令退出容器，然后在宿主机下执行以下命令。

```shell
docker stop $(docker ps -a -q -f "name=terraformgoat*")
docker rm $(docker ps -a -q -f "name=terraformgoat*")
docker rmi $(docker images -a -q -f "reference=registry.cn-hongkong.aliyuncs.com/huoxian_pub/terraformgoat*")
```

## ⚠️ 注意事项

1. 在每个漏洞环境的 README 中都是在 TerraformGoat 容器环境内执行的，因此需要先部署 TerraformGoat 容器环境。
2. 由于部分靶场存在云上内网横向的风险，因此强烈建议用户使用自己的测试账号配置靶场，避免使用生产环境的云账号，使用 Dockerfile 安装 TerraformGoat 也是为了将用户本地的云厂商令牌和测试账号的令牌进行隔离。
3. TerraformGoat 仅可用于教育学习目的，不得用于违法犯罪目的，由 TerraformGoat 产生的结果由使用者承担，与 HXSecurity 无关。

## :confetti_ball: 贡献

我们非常欢迎并感谢你对 TerraformGoat 项目进行贡献，在 [CONTRIBUTING.md](https://github.com/HXSecurity/TerraformGoat/blob/main/CONTRIBUTING.md) 中可以了解贡献流程的细节。

## 🪪 许可证

TerraformGoat 使用 Apache 2.0 许可证，详情参见 [LICENSE](https://github.com/HXSecurity/TerraformGoat/blob/main/LICENSE)

## :crystal_ball: Stats

![Alt](https://repobeats.axiom.co/api/embed/7b7a9507cda2a2e4ec4303668dfc3e3f15ff29d2.svg "Repobeats analytics image")
