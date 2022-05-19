# Alibaba Cloud OSS Bucket HTTP Enable Scenario

English | [中文](./README_CN.md)

## Description

This is a scenario for building an Alibaba Cloud OSS Bucket HTTP Enable.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aliyun/oss/bucket_http_enable
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

View Bucket Policy

```shell
curl http://huoxian-terraformgoat-bucket-xxxxx.oss-cn-beijing.aliyuncs.com/?policy
```

logging disable

```json
{
    "Version": "1", 
    "Statement": [
        {
            "Effect": "Allow", 
            "Action": [
                "*"
            ], 
            "Principal": [
                "*"
            ], 
            "Resource": [
                "acs:oss:*:*:*"
            ], 
            "Condition": {
                "Bool": {
                    "acs:SecureTransport": [
                        "false"
                    ]
                }
            }
        }
    ]
}
```

## Destroy the environment

```shell
terraform destroy
```
