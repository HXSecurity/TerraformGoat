# AWS EBS volumes encryption is disabled

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the AWS EBS volumes encryption is disabled.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/ec2/EBS_volumes_encryption_is_disabled
```

Configure AWS Access Credentials

```shell
aws configure
```

> You can see the access key in the AWS [Console --> Security Credentials]

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

## Steps

Get EBS encryption by default.

```bash
> aws --region us-east-1 ec2 get-ebs-encryption-by-default

{
    "EbsEncryptionByDefault": false
}
```

## Destroy the environment

```shell
terraform destroy
```
