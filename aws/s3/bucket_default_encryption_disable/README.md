# AWS S3 Bucket server-side encryption disable scenario

English | [中文](./README_CN.md)

## Description

This is the scenario in which the AWS S3 bucket server-side encryption disable.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aws/s3/bucket_default_encryption_disable
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

Get the encryption method of the Bucket, if the return content is as follows, then the Bucket encryption is not enabled.

```shell
> aws s3api get-bucket-encryption --bucket houxian-xxx

An error occurred (ServerSideEncryptionConfigurationNotFoundError) when calling the GetBucketEncryption operation: The server side encryption configuration was not found
```

## Destroy the environment

```shell
terraform destroy
```
