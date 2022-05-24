# Tencent Cloud COS Object Public Access Scenario

English | [中文](./README_CN.md)

## Description

This is the scenario in which the Tencent Cloud COS object public access.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/tencentcloud/cos/object_public_access
```

Edit the `terraform.tfvars` file and write your `tencentcloud_secret_id`and`tencentcloud_secret_key` in the file

```shell
vim terraform.tfvars
```

> You can create and view your SecretKey on the [API Key Management](https://console.cloud.tencent.com/cam/capi) of the Tencent Cloud console

Deploy Vulnerable Environment

```shell
terraform init
terraform apply
```

> When the terminal prompts `Enter a value:`, enter `yes`

After the environment is set up, you can see the created Bucket at Outputs.

## Steps

Access Object

```shell
> curl https://houxian-xxx-xxx.cos.ap-beijing.myqcloud.com/flag

{Congratulations on getting flag}
```

## Destroy the environment

```shell
terraform destroy
```
