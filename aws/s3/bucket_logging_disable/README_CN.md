# AWS S3 Bucket 日志存储未开启场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS S3 Bucket 日志存储未开启的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/s3/bucket_logging_disable
```

配置 AWS 访问凭证

```shell
aws configure
```

> 在 AWS 「控制台——》安全凭证」处可以设置并查看你的 `aws_access_key_id` 和 `aws_secret_access_key`

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

当命令执行完后，在 Outputs 处可以看到 Bucket 名称。

## 操作

获取 Bucket 的日志信息，如果返回内容为空则说明未配置日志存储。

```shell
aws s3api get-bucket-logging --bucket houxian-xxx
```

## 销毁环境

```shell
terraform destroy
```
