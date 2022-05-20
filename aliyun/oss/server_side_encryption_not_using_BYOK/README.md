# Alibaba Cloud OSS Bucket Service Side KMS Encryption Not using BYOK

English | [中文](./README_CN.md)

## Description

This is a scenario for building an Alibaba Cloud OSS Bucket server side KMS encryption not using BYOK

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aliyun/oss/server_side_encryption_not_using_BYOK
```

Configure Alibaba Cloud Access Credentials

```shell
aliyun configure
```

> You can create and view your AccessKey on the [AccessKey page](https://ram.console.aliyun.com/manage/ak) of the Alibaba Cloud console

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

After the environment is set up, You can see the bucket url of the scenario at Outputs.

## Steps

View the encryption method of the Bucket

```shell
aliyun oss bucket-encryption --method get oss://huoxian-terraformgoat-bucket-xxxxx
```

If the status code returned is 403, the encryption method is none.

## Destroy the environment

```shell
terraform destroy
```
