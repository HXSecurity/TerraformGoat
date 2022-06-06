# 描述

[English](./README.md) | 中文

这是一个可以帮你快速构建存储桶对象遍历的脚本

在得到FLag之后，可以通过查看源代码来发现什么配置的情况下会造成这种问题

## 部署环境

```bash
cd /TerraformGoat/aliyun/oss/bucket_object_traversal/
```

配置阿里云访问凭证

```shell
aliyun configure
```

> 在阿里云控制台的 [AccessKey 页面](https://ram.console.aliyun.com/manage/ak) 可以创建和查看您的 AccessKey

```BASH
terraform init
terraform apply
```

如果确认没有问题，输入yes开始构建

访问 hx-cloud-security-ctf-xxx.oss-cn-beijing.aliyuncs.com

## 操作

访问 bucket

```shell
hx-cloud-security-xxx.oss-cn-beijing.aliyuncs.com
```

## 销毁挑战

```bash
terraform destroy
```

确定没有问题之后，输入yes即可销毁
