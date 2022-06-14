# 腾讯云 VPC 安全组允许常见端口访问

[English](./README.md) | 中文

## 描述信息

这是一个用于构建腾讯云 VPC 安全组允许常见端口访问的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/tencentcloud/networking/vpc_security_group_open_common_ports
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
> apt-get install jq -y
> tccli vpc DescribeSecurityGroupPolicies --SecurityGroupId sg-o1alubhn | jq '.SecurityGroupPolicySet.Ingress[] | select(.Protocol == "tcp") | select(.CidrBlock == "0.0.0.0/0") | select(.Action == "ACCEPT") | .Port'

"5432"
"25"
"9200"
"4506"
"50070"
"2376"
"21"
"138"
"5500"
"5601"
"50470"
"3389"
"6379"
"4505"
"8020"
"1522"
"23"
"22"
"2375"
"3306"
"5900"
"137"
"1433"
"1521"
"445"
"27017"
"1434"
```

通过返回的内容可以看到当前安全组允许访问的常见端口。

## 销毁环境

```shell
terraform destroy
```
