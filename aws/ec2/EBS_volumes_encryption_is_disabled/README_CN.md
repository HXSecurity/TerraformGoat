# AWS EBS 卷加密默认未开启场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS EBS 卷加密默认未开启的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/ec2/EBS_volumes_encryption_is_disabled
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

## 步骤

获取 EBS 默认加密状态。

```bash
> aws --region us-east-1 ec2 get-ebs-encryption-by-default

{
    "EbsEncryptionByDefault": false
}
```

## 销毁环境

```shell
terraform destroy
```
