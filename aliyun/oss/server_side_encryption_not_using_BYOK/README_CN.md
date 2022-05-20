# 阿里云 OSS Bucket 服务端 KMS 加密未使用 BYOK

[English](./README.md) | 中文

## 描述信息

这是一个用于构建阿里云 OSS Bucket 服务端 KMS 加密未使用 BYOK

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aliyun/oss/server_side_encryption_not_using_BYOK
```

配置阿里云访问凭证

```shell
aliyun configure
```

> 在阿里云控制台的 [AccessKey 页面](https://ram.console.aliyun.com/manage/ak) 可以创建和查看您的 AccessKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

环境搭建完后，在 Outputs 处可以看到 OSS 的 URL

## 操作

查看 Bucket 的加密方式

```shell
aliyun oss bucket-encryption --method get oss://huoxian-terraformgoat-bucket-xxxxx
```

如果返回 403，则说明加密方法为无

## 销毁环境

```shell
terraform destroy
```
