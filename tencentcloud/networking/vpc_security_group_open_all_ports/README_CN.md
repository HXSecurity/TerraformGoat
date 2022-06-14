# 腾讯云 VPC 安全组允许所有端口访问

[English](./README.md) | 中文

## 描述信息

这是一个用于构建腾讯云 VPC 安全组允许所有端口访问的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/tencentcloud/networking/vpc_security_group_open_all_ports
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

环境搭建完后，在 Outputs 处可以看到实例和安全组的 ID

## 步骤

使用腾讯云命令行工具查看安全组的规则。

```bash
> tccli vpc DescribeSecurityGroupPolicies --SecurityGroupId sg-bitg1oeb

{
    "SecurityGroupPolicySet": {
        "Version": "1",
        "Egress": [],
        "Ingress": [
            {
                "PolicyIndex": 0,
                "Protocol": "tcp",
                "Port": "1-65535",
                "ServiceTemplate": {
                    "ServiceId": "",
                    "ServiceGroupId": ""
                },
                "CidrBlock": "0.0.0.0/0",
                "Ipv6CidrBlock": "",
                "SecurityGroupId": "",
                "AddressTemplate": {
                    "AddressId": "",
                    "AddressGroupId": ""
                },
                "Action": "ACCEPT",
                "PolicyDescription": "",
                "ModifyTime": "2022-06-09 17:18:02"
            }
        ]
    },
    "RequestId": "41986b77-47e5-46be-980e-1b93c874d5ff"
}
```

通过返回的内容可以看到当前安全组允许所有端口访问。

## 销毁环境

```shell
terraform destroy
```
