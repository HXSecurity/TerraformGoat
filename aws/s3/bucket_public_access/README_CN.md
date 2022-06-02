# AWS S3 Bucket 允许公开访问

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS S3 Bucket 允许公开访问的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/s3/bucket_public_access
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

## 漏洞利用

访问 Bucket

```shell
> curl https://houxian-xxx.s3.us-east-1.amazonaws.com -s | xmllint --format -

<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Name>houxian-xxx</Name>
  <Prefix/>
  <Marker/>
  <MaxKeys>1000</MaxKeys>
  <IsTruncated>false</IsTruncated>
</ListBucketResult>
```

## 销毁环境

```shell
terraform destroy
```
