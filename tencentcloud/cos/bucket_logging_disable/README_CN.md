# 腾讯云 COS Bucket 日志存储未开启场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建腾讯云 COS Bucket 日志存储未开启的场景。

## 场景搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/tencentcloud/cos/bucket_logging_disable
```

编辑 `terraform.tfvars` 文件，在文件中填入你的`tencentcloud_secret_id`和`tencentcloud_secret_key`

```shell
vim terraform.tfvars
```

> 在腾讯云控制台的 [API 密钥管理](https://console.cloud.tencent.com/cam/capi)可以创建和查看您的 SecretID 和 SecretKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

当命令执行完后，在 Outputs 处可以看到 COS 地址。

## 销毁环境

```shell
terraform destroy
```
