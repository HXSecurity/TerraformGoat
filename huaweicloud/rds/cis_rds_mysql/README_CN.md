# 华为云 RDS Mysql基线检查环境快速构建

[English](./README.md) | 中文

## 描述

这是一个可以帮你快速创建华为云RDS Mysql的脚本，可用于基线检测的样例

如以下CIS安全检查标准

1、确保RDS实例需要所有传入的连接才能使用SSL（自动）

2、确保PostgreSQL数据库服务器的服务器参数“log_disconnections”设置为“ON”

3、确保服务器参数“log_duration为后log_duration数据库服务器设置为“ON”

4、确保PostgreSQL数据库的参数“log_connections”设置为“ON”

.....

## 环境搭建

在容器中运行

```bash
cd /TerraformGoat/huaweicloud/rds/cis_rds_mysql/
```

编辑 `terraform.tfvars` 文件，在文件中填入你的 `huaweicloud_access_key` 和 `huaweicloud_secret_key`

> 在华为云「控制台 --》我的凭证」处可以找到访问密钥

```bash
vim terraform.tfvars
```

部署靶场

```bash
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

## 销毁环境

```bash
terraform destroy
```
