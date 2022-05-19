# Alibaba Cloud OSS Bucket Logging Disable Scenario

English | [中文](./README_CN.md)

## Description

This is a scenario for building an Alibaba Cloud OSS Bucket logging disable.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aliyun/oss/bucket_logging_disable
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

After the scenario is built, you can see the URL of the Bucket in the Outputs.

## Steps

Use aliyun cli to see the current configuration of logging

```shell
aliyun oss logging --method get oss://huoxian-terraformgoat-bucket-xxxxx
```

logging disable

```xml
<?xml version="1.0" encoding="UTF-8"?>
  <BucketLoggingStatus>
    <LoggingEnabled>
      <TargetBucket></TargetBucket>
      <TargetPrefix></TargetPrefix>
    </LoggingEnabled>
  </BucketLoggingStatus>
```

logging enable

```xml
<?xml version="1.0" encoding="UTF-8"?>
  <BucketLoggingStatus>
      <LoggingEnabled>
          <TargetBucket>huoxian-terraformgoat-bucket-xxxxx</TargetBucket>
          <TargetPrefix>log/</TargetPrefix>
      </LoggingEnabled>
  </BucketLoggingStatus>
```

## Destroy the environment

```shell
terraform destroy
```
