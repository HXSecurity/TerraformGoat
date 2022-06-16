# 腾讯云 CBS 云硬盘未使用

[English](./README.md) | 中文

## 描述信息

这是一个用于构建腾讯云 CBS 云硬盘未使用的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/tencentcloud/cvm/cbs_storage_are_not_used
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

环境搭建完后，在 Outputs 处可以看到云硬盘的 ID

## 步骤

使用腾讯云命令行工具查看云硬盘的挂载情况。

```bash
> apt-get install jq -y
> tccli cbs DescribeDisks | jq '.DiskSet[] | select(.DiskId == "disk-abcdefghi") | .DiskState'

"UNATTACHED"
```

通过返回的内容可以看到当前云硬盘处于 UNATTACHED 即未被使用的状态。

## 销毁环境

```shell
terraform destroy
```
