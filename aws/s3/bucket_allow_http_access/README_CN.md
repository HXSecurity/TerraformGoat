# AWS S3 Bucket 允许 HTTP 访问场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS S3 Bucket 允许 HTTP 访问的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/s3/bucket_allow_http_access
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

当命令执行完后，在 Outputs 处可以看到 Bucket 的 URL

## 操作

使用 HTTP 方式访问，发现可以正常访问，说明目标允许 HTTP 访问。

```shell
> curl http://houxian-xxx.s3.us-east-1.amazonaws.com

<?xml version="1.0" encoding="UTF-8"?>
<Error><Code>AccessDenied</Code><Message>Access Denied</Message><RequestId>6BQ1R1KVQV1WZF7E</RequestId><HostId>u2kl/7upzksDaABZSUSqkE1XDyElBfpcjzC6sL0ML0sZZGABdjvwt+woUlBw4wRXt8pcDa+pBVU=</HostId></Error>
```

## 销毁环境

```shell
terraform destroy
```
