# Tencent Cloud CVM Virtual Machine's disk are unencrypted

English | [中文](./README_CN.md)

## Description

This is a scenario used to build the Tencent Cloud CVM Virtual Machine's disk are unencrypted.

## Deployment Environment

Execute the following command in the container

```shell
cd /TerraformGoat/tencentcloud/cvm/cvm_virtual_machine_disks_are_unencrypted
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

After the environment is set up, you can see the ID of the instance in Outputs.

## Steps

Use Tencent Cloud command line tool to view the encryption of the instance mounted disk.

```bash
> tccli configure
> apt-get install jq -y
> tccli cvm DescribeInstances | jq '.InstanceSet[].DataDisks'

[
  {
    "DiskSize": 50,
    "DiskType": "CLOUD_PREMIUM",
    "DiskId": "disk-11lafkjo",
    "DeleteWithInstance": true,
    "SnapshotId": null,
    "Encrypt": false,
    "KmsKeyId": null,
    "ThroughputPerformance": 0,
    "CdcId": null
  }
]
```

## Destroy the environment

```shell
terraform destroy
```
