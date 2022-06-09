# 腾讯云 CVM 磁盘未加密场景

[English](./README.md) | 中文

## 描述信息

这是一个用于构建腾讯云 CVM 磁盘未加密的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/tencentcloud/cvm/cvm_virtual_machine_disks_are_unencrypted
```

编辑 `terraform.tfvars` 文件，在文件中填入你的 `tencentcloud_secret_id` 和 `tencentcloud_secret_key`

```shell
vim terraform.tfvars
```

> 在腾讯云控制台的 [API 密钥管理](https://console.cloud.tencent.com/cam/capi) 可以创建和查看您的 SecretKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

环境搭建完后，在 Outputs 处可以看到实例的 ID

## 步骤

使用腾讯云命令行工具查看实例挂载磁盘的加密情况。

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

通过返回的内容可以看到 Encrypt 为 false，即未加密。

## 销毁环境

```shell
terraform destroy
```
