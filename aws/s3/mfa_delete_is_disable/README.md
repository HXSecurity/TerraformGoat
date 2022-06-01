# AWS S3 Bucket MFA Delete is Disable

English | [中文](./README_CN.md)

## Description

This is the scenario in which the AWS S3 bucket MFA Delete is Disable.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/s3/mfa_delete_is_disable
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

After the environment is set up, you can see the created Bucket at Outputs.

## Steps

Get the MFADelete status of the Bucket.

```shell
> aws s3api get-bucket-versioning --bucket houxian-xxx

{
    "Status": "Enabled",
    "MFADelete": "Disabled"
}
```

## Destroy the environment

```shell
terraform destroy
```
