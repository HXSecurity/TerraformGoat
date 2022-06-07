# 阿里云 ECS 未连接的磁盘没有开启加密

[English](./README.md) | 中文

## 描述信息

这是一个用于构建阿里云 ECS 未连接的磁盘没有开启加密环境的靶场。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aliyun/ecs/ecs_unattached_disks_are_unencrypted
```

配置阿里云访问凭证

```shell
aliyun configure
```

> 在阿里云控制台的 [AccessKey 页面](https://ram.console.aliyun.com/manage/ak) 可以创建和查看您的 AccessKey

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

环境搭建完后，在 Outputs 处可以看到磁盘的名称。

## 操作

通过 aliyun 命令行工具查看磁盘的加密状态。

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

在返回的结果中，可以看到 `"Encrypted": false`，即说明当前磁盘未开启加密。

## 销毁环境

```shell
terraform destroy
```
