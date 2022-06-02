# AWS S3 Bucket allow http access scenario

English | [中文](./README_CN.md)

## Description

This is the scenario in which the AWS S3 bucket allow http access.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/s3/bucket_allow_http_access
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

Access using http

```shell
> curl http://houxian-xxx.s3.us-east-1.amazonaws.com

<?xml version="1.0" encoding="UTF-8"?>
<Error><Code>AccessDenied</Code><Message>Access Denied</Message><RequestId>6BQ1R1KVQV1WZF7E</RequestId><HostId>u2kl/7upzksDaABZSUSqkE1XDyElBfpcjzC6sL0ML0sZZGABdjvwt+woUlBw4wRXt8pcDa+pBVU=</HostId></Error>
```

## Destroy the environment

```shell
terraform destroy
```
