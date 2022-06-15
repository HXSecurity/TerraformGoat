# AWS 快照未加密

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS 快照未加密的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/ec2/snapshots_of_EBS_volumes_are_unencrypted
```

配置 AWS 访问凭证

```shell
aws configure
```

> 在 AWS 「控制台——》安全凭证」处可以设置并查看你的 `aws_access_key_id` 和 `aws_secret_access_key`

部署靶场

```shell
terraform init
terraform apply
```

> 在终端提示 `Enter a value:` 时，输入 `yes` 即可

环境搭建完后，在 Outputs 处可以看到快照的 ID

## 步骤

查看快照加密情况

```bash
> aws ec2 describe-snapshots --snapshot-ids snap-1234567890abcdef0

{
    "Snapshots": [
        {
            "Description": "",
            "Encrypted": false,
            "OwnerId": "012345678910",
            "Progress": "100%",
            "SnapshotId": "snap-1234567890abcdef0",
            "StartTime": "2022-06-15T10:07:39.758Z",
            "State": "completed",
            "VolumeId": "vol-049df61146c4d7901",
            "VolumeSize": 8
        }
    ]
}
```

## 销毁环境

```shell
terraform destroy
```
