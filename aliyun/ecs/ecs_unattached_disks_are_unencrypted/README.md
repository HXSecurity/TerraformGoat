# Alibaba Cloud ECS unattached disks are unencrypted scenario

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Alibaba Cloud ECS unattached disks are unencrypted.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/aliyun/ecs/ecs_unattached_disks_are_unencrypted
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

After the environment is set up, you can see the name of the disk at Outputs.

## Steps

Check the encryption status of the disk via the aliyun command line tool.

```bash
> aliyun ecs DescribeDisks --RegionId cn-beijing --DiskName huocorp-terraform-goat-disk-xxxx

{
  "TotalCount": 1,
  "NextToken": "",
  "PageSize": 10,
  "RequestId": "A7DE5388-2A7F-5C35-A293-1C4B88E95A9F",
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
        "Size": 20,
        "DeleteAutoSnapshot": false,
        "DiskChargeType": "PostPaid",
        "Throughput": 103,
        "IOPS": 1960,
        "MultiAttach": "Disabled",
        "ExpiredTime": "2999-09-08T16:00Z",
        "ImageId": "",
……
```

In the returned result, you can see `"Encrypted": false`, which means that encryption is not enabled on the current disk.

## Destroy the environment

```shell
terraform destroy
```
