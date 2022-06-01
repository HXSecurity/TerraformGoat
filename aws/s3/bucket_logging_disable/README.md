# AWS S3 Bucket logging disable scenario

English | [中文](./README_CN.md)

## Description

This is the scenario in which the AWS S3 bucket logging disable.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/s3/bucket_logging_disable
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

Get bucket logging, If the returned content is empty, the logging is not configured.

```shell
aws s3api get-bucket-logging --bucket houxian-xxx
```

## Destroy the environment

```shell
terraform destroy
```
