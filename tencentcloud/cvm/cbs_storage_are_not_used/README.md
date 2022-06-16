# Tencent Cloud CBS storage are not used

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Tencent Cloud CBS storage are not used.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/tencentcloud/cvm/cbs_storage_are_not_used
```

Edit the `terraform.tfvars` file and write your `tencentcloud_secret_id` and `tencentcloud_secret_key` in the file

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

After the environment is set up, you can see the ID of the cbs in Outputs.

## Steps

Use Tencent Cloud command line tool to check the mount status of cbs.

```bash
> apt-get install jq -y
> tccli cbs DescribeDisks | jq '.DiskSet[] | select(.DiskId == "disk-abcdefghi") | .DiskState'

"UNATTACHED"
```

## Destroy the environment

```shell
terraform destroy
```
