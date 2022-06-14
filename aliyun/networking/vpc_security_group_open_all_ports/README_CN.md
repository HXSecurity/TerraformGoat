# 阿里云 VPC 安全组允许所有端口访问

[English](./README.md) | 中文

## 描述信息

这是一个用于构建阿里云 VPC 安全组开放所有端口的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aliyun/networking/vpc_security_group_open_all_ports
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

环境搭建完后，在 Outputs 处可以看到安全组的 ID

## 操作

通过 aliyun 命令行工具查看安全组的规则。

```bash
> aliyun ecs DescribeSecurityGroupAttribute --SecurityGroupId sg-2zebb34geaa1x63gtkor

{
  "Description": "",
  "RequestId": "68C5FDBC-64DE-58B5-BA3F-7EF4DDD0AA82",
  "SecurityGroupName": "huocorp_terraform_goat_security_group",
  "VpcId": "vpc-2ze61byz86qst1qstj5id",
  "SecurityGroupId": "sg-2zebb34geaa1x63gtkor",
  "Permissions": {
    "Permission": [
      {
        "SourceGroupId": "",
        "Policy": "Accept",
        "Description": "",
        "SourcePortRange": "",
        "Priority": 1,
        "CreateTime": "2022-06-08T10:52:52Z",
        "DestPrefixListName": "",
        "Ipv6SourceCidrIp": "",
        "NicType": "intranet",
        "DestGroupId": "",
        "Direction": "ingress",
        "SourceGroupName": "",
        "PortRange": "1/65535",
        "DestGroupOwnerAccount": "",
        "DestPrefixListId": "",
        "SourceCidrIp": "0.0.0.0/0",
        "SourcePrefixListName": "",
        "IpProtocol": "TCP",
        "DestCidrIp": "",
        "DestGroupName": "",
        "SourceGroupOwnerAccount": "",
        "Ipv6DestCidrIp": "",
        "SourcePrefixListId": ""
      }
    ]
  },
  "RegionId": "cn-beijing",
  "InnerAccessPolicy": "Accept"
}
```

从返回的结果可以看到当前安全组允许来自 0.0.0.0/0 的 IP 访问 1/65535 端口，即表示允许所有人访问所有端口。

## 销毁环境

```shell
terraform destroy
```
