# 阿里云 VPC 安全组允许常见端口访问

[English](./README.md) | 中文

## 描述信息

这是一个用于构建阿里云 VPC 安全组常见端口访问的场景。

## 环境搭建

在容器中执行以下命令

```shell
cd /TerraformGoat/aliyun/networking/vpc_security_group_open_common_ports
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

通过 aliyun 命令行工具查看安全组中允许所有人访问的端口。

```bash
apt-get install jq -y
aliyun ecs DescribeSecurityGroupAttribute --SecurityGroupId sg-1zeffzf4e3akdwklefyf | jq '.Permissions.Permission[] | select(.Policy == "Accept") | select(.SourceCidrIp == "0.0.0.0/0") | select(.IpProtocol == "TCP") | .PortRange'
```

```bash
> aliyun ecs DescribeSecurityGroupAttribute --SecurityGroupId sg-1zeffzf4e3akdwklefyf | jq '.Permissions.Permission[] | select(.Policy == "Accept") | select(.SourceCidrIp == "0.0.0.0/0") | select(.IpProtocol == "TCP") | .PortRange'

"27017/27017"
"4505/4505"
"21/21"
"5601/5601"
"1521/1521"
"3389/3389"
"138/138"
"137/137"
"3306/3306"
"50070/50070"
"23/23"
"50470/50470"
"5432/5432"
"8020/8020"
"6379/6379"
"1522/1522"
"445/445"
"4506/4506"
"1433/1433"
"2375/2375"
"2376/2376"
"5500/5500"
"9200/9200"
"5900/5900"
"25/25"
"1434/1434"
"22/22"
```

## 销毁环境

```shell
terraform destroy
```
