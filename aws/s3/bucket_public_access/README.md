# AWS S3 Bucket allow public access

English | [中文](./README_CN.md)

## Description

This is the scenario in which the AWS S3 bucket allow public access.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/s3/bucket_public_access
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

## Vulnerability Utilization

Access bucket

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

## Destroy the environment

```shell
terraform destroy
```
