# AWS EBS 卷未使用

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS EBS 卷未使用的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/ec2/EBS_volumes_are_not_used
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

在 Outputs 处可以看到 volume 的 ID

## 步骤

获取 EBS 状态，如果 State 状态为 available，则说明 EBS 处于未使用的状态。

```bash
> aws ec2 describe-volumes --volume-ids vol-1234567890abcdef0

{
    "Volumes": [
        {
            "Attachments": [],
            "AvailabilityZone": "us-east-1a",
            "CreateTime": "2022-06-16T06:38:32.476Z",
            "Encrypted": false,
            "Size": 1,
            "SnapshotId": "",
            "State": "available",
            "VolumeId": "vol-1234567890abcdef0",
            "Iops": 100,
            "VolumeType": "gp2",
            "MultiAttachEnabled": false
        }
    ]
}
```

## 销毁环境

```shell
terraform destroy
```
