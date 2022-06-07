# Alibaba Cloud ECS Virtual Machine's disk are unencrypted

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Alibaba Cloud ECS Virtual Machine's disk are unencrypted.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aliyun/ecs/ecs_virtual_machine_disks_are_unencrypted
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

After the environment is set up, you can see the ID of the instance at Outputs.

## Steps

View the encryption status of the instance disk via the aliyun command line tool.

```bash
> aliyun ecs DescribeDisks --RegionId cn-beijing --InstanceId i-2zef2uf3eaujxc2db7yq

{
  "TotalCount": 1,
  "NextToken": "",
  "PageSize": 10,
  "RequestId": "18816891-0DB4-54A6-A4A8-421D7C84AE8F",
  "PageNumber": 1,
  "Disks": {
    "Disk": [
      {
        "DetachedTime": "",
        "Category": "cloud_efficiency",
        "Description": "",
        "KMSKeyId": "",
        "ResourceGroupId": "",
        "Encrypted": false,
        "Size": 40,
        "DeleteAutoSnapshot": false,
        "DiskChargeType": "PostPaid",
        "Throughput": 106,
……
```

In the returned result, you can see `"Encrypted": false`, which means that the disk mounted by the instance is not encrypted.

## Destroy the environment

```shell
terraform destroy
```
