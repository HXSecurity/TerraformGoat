# AWS 安全组允许所有端口访问

[English](./README.md) | 中文

## 描述信息

这是一个用于构建 AWS 安全组允许所有端口访问的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aws/networking/vpc_security_group_open_all_ports
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

环境搭建完后，在 Outputs 处可以看到安全组的 ID

## 步骤

查看创建的安全组规则

```bash
> aws ec2 describe-security-groups --group-ids sg-015ab313fbb70s95b

{
    "SecurityGroups": [
        {
            "Description": "Managed by Terraform",
            "GroupName": "huocorp_terraform_goat_security_group",
            "IpPermissions": [
                {
                    "FromPort": 1,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 65535,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "0123456789012",
            "GroupId": "sg-015ab313fbb70s95b",
            "IpPermissionsEgress": [],
            "VpcId": "vpc-13194b56d96ac1f8h"
        }
    ]
}
```

## 销毁环境

```shell
terraform destroy
```
